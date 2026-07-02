Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEF73CAA57;
	Fri,  3 Jul 2026 11:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079823; cv=none; b=FvdhLEvehtqjzEa/KtQyzwjNYYsyxUdjiv7eZ17tuh7wPa05ib502Q7vEbYAo48KN7oL4JXa3fogqCpiaS2t4F0sTr51mfZiRwg3hEFW7Mu1cpgd5yX7nJ++1HHTPqzAukbArF6/XHuy1P37tGItZed2dkXM9zUJfgSZA8vxcpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079823; c=relaxed/simple;
	bh=9fkNopJlziDc4GTqU8dPUBH/Po6TqTsNY6qttFClkFI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tD0kFsPR6atERhnz1urwZXjVVZO9fdJdFhEcyu40xBiSEd4L/DohpvrOaL3ZRkc7wusI8DjCWtUY4ksF4mlZSKOkTsqNv/QaG0cK/NmWFH8Y1yKKl8YdIVsJbe3MQEnciw6bQSGIMlJGidfB5W2d+xN3QGiJKCaAbLaqkWystVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gvTkQJ7k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gvTkQJ7k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBB81F000E9;
	Fri,  3 Jul 2026 11:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783079822;
	bh=sM/2S5Be0jfInrOEmvladGpBvCeTqeQv2zf3HbupS9A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gvTkQJ7kZvHVxY28E55ON485YTQRCor/YY5Y3vBm9jPTTnD00HITrIEM27MrKYL2H
	 tpAWs6ukRLXmVRf843eE4+3/Rtg+x5DI5d8y9UD23hTjS76cRDFawqgm/VlffgWNTJ
	 UCM+Ga3AU/SMT042VXVjMDF512PI7EzsTRzlKy3XHXXoeA+PiCOVs3kukWDD9qemot
	 Ukno2TQdwHGmRjlwEvQBo/7EipVOwonKI7vDbzZiU4Fjr/gHjO4TwxIQvESwlxmeO5
	 fEYBKo6docFl0z+qg+AJ6ANM/RruSqNN/bndKNz/KrTohQ82aBtkhdBSFIMPa+m6+m
	 hUja+4OJ3cKeA==
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
 loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <cover.1782439646.git.zhoubinbin@loongson.cn>
References: <cover.1782439646.git.zhoubinbin@loongson.cn>
Subject: Re: [PATCH v3 0/9] ASoC: Add Loongson-2K0300 I2S controller and
 sound card support
Message-Id: <178301908251.189993.17039644134468947360.b4-ty@b4>
Date: Thu, 02 Jul 2026 20:04:42 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2403; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9fkNopJlziDc4GTqU8dPUBH/Po6TqTsNY6qttFClkFI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqR6OKGeq1/scVMGYWbom2WY402C26y59J82jg8
 PeNfPULzwmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakejigAKCRAk1otyXVSH
 0GxjB/9IMNImexECK1xw4wWQgbXjs4SKHYXNuqlJfALVe3qJgjuoULdxVxzz74G2+YgJLP/wwr5
 N9uAtm10+qm/TLuKIgtf7nwDpCmLMPjbnD7iTlwCDlz9VlGhwttXJJsMyFx6sYa9/JlazGhs3ta
 D3GC/rAsPRvokuipUTJVdje5fbMtuqQP4LJYCTgJRlsYRUbdBCJc+7LIItMCtuKVNC19ORmI4+n
 SWo+uIePLTJJ7glHn59Eprzt64yqf2EcAwn6AKQ9PWqY1lGETtUpnW7qdhnjWlg4BFIxXpiwn11
 w5lx6rMKKHpeYA5T291B2DrUkqjaLsURpymLKQh9PgK2FzXM
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 26 Jun 2026 10:27:02 +0800, Binbin Zhou wrote:
> ASoC: Add Loongson-2K0300 I2S controller and sound card support
> 
> Hi all:
> 
> This series adds ASoC support for the Loongson-2K0300 SoC and its
> associated development boards, including the CTCISZ Forever Pi and the
> ATK-DL2K0300B.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/9] ASoC: loongson: Fix error handling in ACPI property parsing
      https://git.kernel.org/broonie/sound/c/0eb0e3c623ac
[2/9] ASoC: dt-bindings: loongson,ls2k1000-i2s: Document Loongson-2K0300 compatible
      https://git.kernel.org/broonie/sound/c/914e95aaec0d
[3/9] ASoC: loongson: Add Loongson-2K0300 I2S controller support
      https://git.kernel.org/broonie/sound/c/41ab1f8a0eda
[4/9] ASoC: dt-bindings: loongson,ls-audio-card: Use common sound card
      https://git.kernel.org/broonie/sound/c/95133a9ac817
[5/9] ASoC: dt-bindings: loongson,ls-audio-card: Add ctcisz forever pi compatible
      https://git.kernel.org/broonie/sound/c/5460b4ddc76a
[6/9] ASoC: loongson: Add Loongson-2K0300 CTCISZ Forever Pi sound card support
      https://git.kernel.org/broonie/sound/c/da659805e0b0
[7/9] ASoC: dt-bindings: loongson,ls-audio-card: Add ATK-DL2K0300B compatible
      https://git.kernel.org/broonie/sound/c/3ddae79479f6
[8/9] ASoC: loongson: Add headphone jack detection and DAPM routing
      https://git.kernel.org/broonie/sound/c/dde4064a4913
[9/9] ASoC: es8328: Add DAPM routes from MIC inputs to Mic Bias
      https://git.kernel.org/broonie/sound/c/5f988d622318

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

