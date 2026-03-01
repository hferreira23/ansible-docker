# Changelog

## [1.3.2](https://github.com/hferreira23/ansible-docker/compare/1.3.1...1.3.2) (2026-03-01)


### Build System

* **deps:** bump ansible-core from 2.20.2 to 2.20.3 ([#27](https://github.com/hferreira23/ansible-docker/issues/27)) ([ad2b904](https://github.com/hferreira23/ansible-docker/commit/ad2b904efb8ebc66e7221ed730524349a9839cc5))
* **deps:** bump ansible-lint from 26.1.1 to 26.2.0 ([#29](https://github.com/hferreira23/ansible-docker/issues/29)) ([355f39b](https://github.com/hferreira23/ansible-docker/commit/355f39b2a28e2e7dd623e3c9725c6cb88ee26082))
* **deps:** bump ara from 1.7.4 to 1.7.5 ([#28](https://github.com/hferreira23/ansible-docker/issues/28)) ([5869593](https://github.com/hferreira23/ansible-docker/commit/58695936ccdc89a1ad45e1817b59276c4314c568))

## [1.3.1](https://github.com/hferreira23/ansible-docker/compare/1.3.0...1.3.1) (2026-02-15)


### Documentation

* update README ([#20](https://github.com/hferreira23/ansible-docker/issues/20)) ([0992b38](https://github.com/hferreira23/ansible-docker/commit/0992b385e7e6046ebaa117be2485423f3da47774))


### Build System

* **deps:** bump ansible-core from 2.20.1 to 2.20.2 ([#24](https://github.com/hferreira23/ansible-docker/issues/24)) ([29e6f6b](https://github.com/hferreira23/ansible-docker/commit/29e6f6b4088345b80a581cfa51d283353285dddb))
* **deps:** bump ansible-lint from 25.12.1 to 26.1.1 ([#25](https://github.com/hferreira23/ansible-docker/issues/25)) ([189a64e](https://github.com/hferreira23/ansible-docker/commit/189a64e171024a1c5c16ad9a0a593f97b89d7415))
* **deps:** bump jmespath from 1.0.1 to 1.1.0 ([#23](https://github.com/hferreira23/ansible-docker/issues/23)) ([4d0e557](https://github.com/hferreira23/ansible-docker/commit/4d0e557ba43d952fcb4def85397bebc5a43e4212))


### Continuous Integration

* adding pip to dependabot ([#22](https://github.com/hferreira23/ansible-docker/issues/22)) ([56d5eb7](https://github.com/hferreira23/ansible-docker/commit/56d5eb74398cf52654d355eb079c7030373b19bf))
* tweak CI to handle dependabot requirements updates ([#26](https://github.com/hferreira23/ansible-docker/issues/26)) ([2634e9e](https://github.com/hferreira23/ansible-docker/commit/2634e9e408654b8ebe5b59d55f1f272c48fbd2c3))

## [1.3.0](https://github.com/hferreira23/ansible-docker/compare/v1.2.0...1.3.0) (2025-12-29)


### Features

* adding pihole collection ([#19](https://github.com/hferreira23/ansible-docker/issues/19)) ([b924555](https://github.com/hferreira23/ansible-docker/commit/b9245557cf7d15644dde84b6f8b0ea4673821f5f))


### Documentation

* update README badges ([#18](https://github.com/hferreira23/ansible-docker/issues/18)) ([100588e](https://github.com/hferreira23/ansible-docker/commit/100588e48562e76b5de7e2e874ac8cd47ee14b29))
* update README.md ([#15](https://github.com/hferreira23/ansible-docker/issues/15)) ([cc16038](https://github.com/hferreira23/ansible-docker/commit/cc16038fd0f5e0d444b8fd657066fdddfdf56973))


### Continuous Integration

* job ordering and release-please config tweak ([#14](https://github.com/hferreira23/ansible-docker/issues/14)) ([b54e529](https://github.com/hferreira23/ansible-docker/commit/b54e5293788e2540f2df685245e26d6f2a2344ba))
* refactor jobs ([#16](https://github.com/hferreira23/ansible-docker/issues/16)) ([5f28d82](https://github.com/hferreira23/ansible-docker/commit/5f28d8202a22eead1fa0e89b37dea921c6cf5cb9))

## [1.2.0](https://github.com/hferreira23/ansible-docker/compare/v1.1.0...v1.2.0) (2025-12-26)


### Features

* migrate to python dhi image ([#11](https://github.com/hferreira23/ansible-docker/issues/11)) ([2302bf3](https://github.com/hferreira23/ansible-docker/commit/2302bf3a37acb4a0d05555a53f6c4d610855feec))

## [1.1.0](https://github.com/hferreira23/ansible-docker/compare/v1.0.0...v1.1.0) (2025-12-23)


### Features

* **images:** pushing images to ghcr ([#5](https://github.com/hferreira23/ansible-docker/issues/5)) ([a788cc3](https://github.com/hferreira23/ansible-docker/commit/a788cc3f749c0399a3d03aa597caf25ec76e72da))


### Bug Fixes

* auto merge ci ([#7](https://github.com/hferreira23/ansible-docker/issues/7)) ([4f64661](https://github.com/hferreira23/ansible-docker/commit/4f64661a891e27a3f58b61c88719e684f3c65998))

## 1.0.0 (2025-12-22)


### ⚠ BREAKING CHANGES

* **refactor:** adding gh actions + refactor

### Features

* bump to Py 3.13 ([dec4b12](https://github.com/hferreira23/ansible-docker/commit/dec4b12751a45e5401ba0fef959ad0fd5206df07))
* **refactor:** adding gh actions + refactor ([ed1926d](https://github.com/hferreira23/ansible-docker/commit/ed1926dbdfeaaadedec82d37407b6c70d22e0689))
* running ci on push to master ([874fd24](https://github.com/hferreira23/ansible-docker/commit/874fd246d7d940ab8e4b0905a120eba6c4b97fbd))


### Bug Fixes

* branch is called main and not master ([c5b60f9](https://github.com/hferreira23/ansible-docker/commit/c5b60f9032ec2f05aa7ffcc2b57be6240a36f386))
* call correct base container ([70c7be0](https://github.com/hferreira23/ansible-docker/commit/70c7be03e7e8d5ee2e505438a3d296099222387f))
* folder name ([10c6b61](https://github.com/hferreira23/ansible-docker/commit/10c6b61a52669ba3cafa74536f3ec04e273855d8))
* removing ansiblemetrics ([eaf67ad](https://github.com/hferreira23/ansible-docker/commit/eaf67ad4bf57975d99926f7c78bcdcebe43d45b9))
* removing dockerfile warnings ([fb10dea](https://github.com/hferreira23/ansible-docker/commit/fb10dea197ce26ac0cc1f2b62da839b6a9a78dac))
* too soon to go ansible 2.19.0 ([d49b5c3](https://github.com/hferreira23/ansible-docker/commit/d49b5c39fb7766a04dc874628d344c4a13e38c1c))
