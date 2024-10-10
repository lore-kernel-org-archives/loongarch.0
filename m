Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6571C2DC8;
	Thu, 10 Oct 2024 11:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728558855; cv=none; b=BTeggg+fvhRWYIQGsBF5lDRgG0TcGfZygew0yLHOqILWYgP0lJ5diQ6fT4FS9N9rtT5glAgaYx93LGbc74SvLZ2aSQJXTTt+NDMW1CAOgu1jZieVSpWIJ8O4bwT9JUvj6/KPUQ7U3IHKXK2SSv3k0RXxrcgdOzNoT9u0HFL2nPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728558855; c=relaxed/simple;
	bh=yimnheOQtKviFcnoHT8nlYQ+Lzpz2qCO7iOqKUctSxI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mKsGTp+5qADEEa//yqC79MAVgrLhplcMQPQToI3TuR0G+pGxH6UeIzHAPPEzbf7lLSb3HI6hYlp4oEC9GCMiI0iRtoHNpr1DKkX45GWPlRdtHZ7VIZKGIaNwT0O/6ezTIo17RqQxGmX7cSweK0pQ23weVrGBjaYWn1FrV//BT38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsnjJsC6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsnjJsC6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B82AC4CEC6;
	Thu, 10 Oct 2024 11:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728558854;
	bh=yimnheOQtKviFcnoHT8nlYQ+Lzpz2qCO7iOqKUctSxI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jsnjJsC6wV1HeLK5bX5su+dwHaEQPFBKCIOWSp90CXMAXanaDsv1Aanz47DVSbYOK
	 BsNBu2at46GYpSQcNC0Xd2eMyBanh8moyYV3e7k2bXtF0nU4zL9mTlWKhYJQBkK+Yp
	 gSSYsdrOYslaF7b7lj0b0/kwtCPtH8vv6XPZ4ZS7Vx306nlDmWEbV7ReBmVOUJR+08
	 RtkQstZvo1KDKsWPtJO82Hlsle9k5CACLQWTRyi+g/QwrI/pZ3DsjB/0LmFvOt3dRm
	 Mh7KfEYOd25f8QI8mV1EIaJdvT/8xKLwjTJgjza9ftZD18HPDY3FinajQMmMNbiJMp
	 dEZA+M9v4aklg==
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, 
 loongarch@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Weidong Wang <wangweidong.a@awinic.com>, 
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Shuming Fan <shumingf@realtek.com>
In-Reply-To: <cover.1728459624.git.zhoubinbin@loongson.cn>
References: <cover.1728459624.git.zhoubinbin@loongson.cn>
Subject: Re: (subset) [PATCH v3 0/9] ASoC: Some issues about loongson i2s
Message-Id: <172855884981.3258793.17729935826036139739.b4-ty@kernel.org>
Date: Thu, 10 Oct 2024 12:14:09 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Wed, 09 Oct 2024 15:51:42 +0800, Binbin Zhou wrote:
> This patch set is mainly about Loongson i2s related issues.
> 
> Please allow me to briefly explain this patch set:
> Patch 1-2: Add ES8323 codec required on Loongson-2K2000
> Patch 3-4: Add uda1342 codec required on Loongson-2K1000
> Patch 5: Fix the problem of unable to detect codec under FDT system.
> Patch 6-7: Add Loongson i2s platform device support
> Patch 8-9: Related DTS support.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: dt-bindings: Add Everest ES8323 Codec
      commit: 5bf2bea8a8b3d0255953868c7bf652235a17a65d
[2/9] ASoC: codecs: Add support for ES8323
      commit: b97391a604b9e259c6a983fc1b715d205d9da505
[3/9] ASoC: dt-bindings: Add NXP uda1342 Codec
      commit: de567431596a8163a9441407fdab315f12bc2769
[4/9] ASoC: codecs: Add uda1342 codec driver
      commit: de0fb25e37aae7aae133d6c3d0b0e1e31a79878d
[5/9] ASoC: loongson: Fix component check failed on FDT systems
      (no commit info)
[6/9] ASoC: dt-bindings: Add Loongson I2S controller
      commit: d4c2e9e33a0c903cc3a00114d6c02aa2cf403d33
[7/9] ASoC: loongson: Add I2S controller driver as platform device
      commit: ba4c5fad598c07492844e514add3ccda467063b2

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

