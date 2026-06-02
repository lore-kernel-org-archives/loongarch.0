Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB4F3F6614;
	Wed,  3 Jun 2026 07:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470305; cv=none; b=dS1LQxBCoBJ3gYqLs2kS7MuGFxjDZQL8o7eqNKH0n+FOVz+2Rd9+b3HDPsd1WozGV2EkX15jUoqJnJRA9pnzjNnohXX62Yhg9AlxJk1PR80QotdnAfIM9V595GQumwWllRnAHbg6JsIfUXB04c1qwI7Vz+IT1BuSg+f1+lWj7ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470305; c=relaxed/simple;
	bh=AELU42MnWa4S88uLSBGWcq9dRu+irkBXHcHHjKxgeNA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sCOuTqOzpdmIaZcOxI5oMWNXH44iX8wGQl7uw8Bl5RC+60PztL9WckPZovlTeU4E6jQIL4tdofa1CXJWENS7G8R9CepaCVDeJfGBiuuikNEygG//x+8LYVfIPFLfCXDJCRQOH0/2AmbB7a3010CQ0RhNjhv00pe6xfxlQ2/tFcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HMwuPh2t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HMwuPh2t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0FD1F00893;
	Wed,  3 Jun 2026 07:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780470304;
	bh=Sy1l5xNhv+UMoxP7UNxi1MlKffXd5c0ueD7rm97QYIg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HMwuPh2t+/i/h3Tln775A51JLeOJSpycs0eqP4ZyVH7BziqMSTjERqyydv+KAK7eW
	 HJPfvGVRSAntSuXJqmdZIufi1gMZtxyA5apzld8G9a+Hirg1kpxjfugY45bCElqjrp
	 PeO+/HkFnAhw4PozY3xzT3ZytZvy84kt30AFiEjF19BstqTVZABBUXZe0kAkli2GZ2
	 5FfNnrfeaLoyNbEAhrWuW5YM4QIen5IBdaapcYvPmgr9VaMZfaaX+vWtTexWhplmI+
	 e0DPDnD3i9/AmQaXKmKfeByzSiAW7G4TV5hP4RWMcWDDHiyeHS/6XkLRI9uXLw7/PG
	 8CmUYQlN9eVBA==
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Huacai Chen <chenhuacai@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
 loongarch@lists.linux.dev, linux-sound@vger.kernel.org
In-Reply-To: <cover.1780304703.git.zhoubinbin@loongson.cn>
References: <cover.1780304703.git.zhoubinbin@loongson.cn>
Subject: Re: [PATCH v3 0/4] ASoC: loongson: Refactor DMA and regmap
 handling
Message-Id: <178041371415.93058.4794135670349989571.b4-ty@b4>
Date: Tue, 02 Jun 2026 16:21:54 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1740; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AELU42MnWa4S88uLSBGWcq9dRu+irkBXHcHHjKxgeNA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqH9IdSfqPPZRh9e/ijfYo4yIzTFPUsoSMnKRiI
 9IuAn34+5uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah/SHQAKCRAk1otyXVSH
 0MpiB/9RNApu4lj/H8RSFvz2KkV/Rb98xWIU56q/b3gtoH9OQFuPjA4a9RPt1HkAVuUk6JJbqPc
 h/QXJK0njjluMF4bN7LWM7f4oCSbAAj8nmqDCChRAhXF7wTAEStlKor4RYrtMck3NES1jwVDBOd
 9ZqHRwkWQM2dLfDLb/X2Wsw4HwWlfP6ZhEiO0hnIYX7SzvKSA6yV0K2k7GGfpz9uw4EklDlF1Q4
 32Eau3U6UCWecFUuEmU62Twoq4lJbbWh3znJD3qt2ABJZRUSE3AyZIGERE8v5kN4GV//MVITc+2
 EVJ3ZHYtuEWd8CsC40n1VN+YVdPUpXqp4+0A1xXFWdM7j7XE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 01 Jun 2026 17:29:35 +0800, Binbin Zhou wrote:
> ASoC: loongson: Refactor DMA and regmap handling
> 
> Hi all:
> 
> This series refactors the Loongson I2S ASoC drivers, reducing code
> duplication and improving DMA differentiation. It also adds an entry
> in MAINTAINERS and applies a few fixes to the es8323 codec driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/4] MAINTAINERS: Add entry for Loongson ASoC driver
      https://git.kernel.org/broonie/sound/c/90c6f9c8cbb6
[2/4] ASoC: loongson: Combined regmap definitions
      https://git.kernel.org/broonie/sound/c/8a6fd3377015
[3/4] ASoC: loongson: Use the `idma` identifier for internal DMA variables
      https://git.kernel.org/broonie/sound/c/353530ece852
[4/4] ASoC: loongson: Separate external shared DMA from the platform interface
      https://git.kernel.org/broonie/sound/c/767a1b50c1f0

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

