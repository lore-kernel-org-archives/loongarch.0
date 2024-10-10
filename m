Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75521C579C
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 12:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728562540; cv=none; b=TKvJC53GWwhwlB1eNQEpL9bQnZVAEV1Z7W++95Ai0LnMM8gSyNTyhOIiZ1VU7l6a9KB8XxLCm7ha/u3qQ4Gn2BAwnp4DAW6iybXcoUwj5OuTjg4+QXrRXxlgkUgujV5W0JbkoDsZX02VoL0RHjNYMYo+ulfnd1fcFpSMhZpEfFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728562540; c=relaxed/simple;
	bh=5VJgFYrRqUn6q6H26eMzLtMtVpybti1EcGRLCarbIDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VKeLizXgXj/b2CjXqwnD62JUHef0YSlU+IW0FiSIybsZFU+/Zd0G0H0tQE4Mr6ZiHAUxvHZc/+skNMlmjAMVB3LJPekX1ivklAxV8d/2PDIwSt6mjDH6czqQbDzDMcQJ/iZ7Zq3s40YBlXLpwPZrWWTZ5B7mkqbtdprbZ3R/6k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flZNupk/; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flZNupk/"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a991fedbd04so65953666b.3
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 05:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728562537; x=1729167337; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/gfnI2SBhHwah5Wl7yD0ISsvU/I+TP7Ml1kxxMymlo=;
        b=flZNupk/s1XOj0zEWxTQKIZuvicVeEn6CZeNhH+fRQX7CfuSnQougrM4quA2Tq3/yY
         TwvJ8IU5gUWFqqHy1wocuBLYLs5FYe2oDCPgFtFyDYlULQ/34kSVlLMb0d4v+F6PFuZU
         uy05ONCbjqJe8RIrto0TqXdEuXy5IDs1Lcuq2gb8CjNOsrcEsj9WHxUIBVAUXrziopQP
         25n5orRqVIzPVKw/KWKlM7Mfp/2m9wepoBZKX8BvqghZgjxfzWXjoIiYpBUnbNQO0ekB
         SdAb+L6ZF4SYOfCfE85q3gfX8BvmTSsQbzb5nUzLyrfQBhPmadATo84MIdUaypXxv9Ne
         9RZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728562537; x=1729167337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/gfnI2SBhHwah5Wl7yD0ISsvU/I+TP7Ml1kxxMymlo=;
        b=JMxX8zdhWn/DShdxgRmXzNYtpwDkZDGwDRs8f7DkMd9iggyQVhrk4BI2qLgvYgFm28
         946YxfQXQu0TAfige+410EgrqvVTooRgy1bHweiSW/EcVz6IjIfDVYtB8Acz/5+47v11
         XKACcHr0VqUFgkdFeBYy7XgHuZhjZgqqp7ryxpzpNt5299Qhs6kHZefiahSluMVXjVyF
         JgducW31KZFNMkUnABNw4pk/JykoltIfHHRoowlmXRMQXUuD/0vGCmdgghXQLmkx6fGb
         A44Xpn5I7dtkrFf8dqrOPHeK0p8/NEOiNXBnIi1gLkC1uzl8Gz4vP46QjXZ6n+BijTcm
         p6Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWRmxXS/+bujo9vt30RWvcB5jPnu6yMYkm3WhX2AkVlQOgV+CxNfbwRUiQc7EjBtFcHWE3DqfALQ3I=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwLUhtq6iy7pGjS2XtSj/WvmQTcNppyVhRVsFBacrxoJ3Ff4mx
	oBG94BP2NP46unVgRbR8QZKcBpkNvOcdaZzN6s4K9BkgILjEanNOonRsBR8DsHlwJi35llJO2+n
	ZlE9rEq0ueYop19EXONAm0Q6jxtw=
X-Google-Smtp-Source: AGHT+IEiYRJRB+HkFMOeRqY1TKBP80bIZBEqHDnrqmizaC4i1QreztoqIqB9+SJ0fIqKMwJiVZrFvtR1VgO8tJ6JNyg=
X-Received: by 2002:a05:6402:249f:b0:5c7:202f:ec9b with SMTP id
 4fb4d7f45d1cf-5c91d58ecf9mr7898995a12.16.1728562536143; Thu, 10 Oct 2024
 05:15:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1728459624.git.zhoubinbin@loongson.cn> <172855884981.3258793.17729935826036139739.b4-ty@kernel.org>
In-Reply-To: <172855884981.3258793.17729935826036139739.b4-ty@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 10 Oct 2024 18:15:22 +0600
Message-ID: <CAMpQs4+0_P0ExcU7O12XvKPQ+CoP8KpAWUJpL2wP4--+gWQ6hA@mail.gmail.com>
Subject: Re: (subset) [PATCH v3 0/9] ASoC: Some issues about loongson i2s
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, Prasad Kumpatla <quic_pkumpatl@quicinc.com>, 
	Herve Codina <herve.codina@bootlin.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Shuming Fan <shumingf@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

On Thu, Oct 10, 2024 at 5:14=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, 09 Oct 2024 15:51:42 +0800, Binbin Zhou wrote:
> > This patch set is mainly about Loongson i2s related issues.
> >
> > Please allow me to briefly explain this patch set:
> > Patch 1-2: Add ES8323 codec required on Loongson-2K2000
> > Patch 3-4: Add uda1342 codec required on Loongson-2K1000
> > Patch 5: Fix the problem of unable to detect codec under FDT system.
> > Patch 6-7: Add Loongson i2s platform device support
> > Patch 8-9: Related DTS support.
> >
> > [...]
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
next
>
> Thanks!
>
> [1/9] ASoC: dt-bindings: Add Everest ES8323 Codec
>       commit: 5bf2bea8a8b3d0255953868c7bf652235a17a65d
> [2/9] ASoC: codecs: Add support for ES8323
>       commit: b97391a604b9e259c6a983fc1b715d205d9da505
> [3/9] ASoC: dt-bindings: Add NXP uda1342 Codec
>       commit: de567431596a8163a9441407fdab315f12bc2769
> [4/9] ASoC: codecs: Add uda1342 codec driver
>       commit: de0fb25e37aae7aae133d6c3d0b0e1e31a79878d
> [5/9] ASoC: loongson: Fix component check failed on FDT systems
>       (no commit info)

Thanks for applying this patchset.

But I don't seem to see the 5th patch in the for-next branch, what
other questions do you have about that patch?
On FDT systems we need this patch, otherwise the component check will fail.

Thanks.
Binbin
> [6/9] ASoC: dt-bindings: Add Loongson I2S controller
>       commit: d4c2e9e33a0c903cc3a00114d6c02aa2cf403d33
> [7/9] ASoC: loongson: Add I2S controller driver as platform device
>       commit: ba4c5fad598c07492844e514add3ccda467063b2
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark
>
