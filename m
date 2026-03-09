Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1883D7D7E
	for <loongarch@lists.linux.dev>; Mon,  9 Mar 2026 15:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068826; cv=pass; b=OqEt2lTBlw8De3G5/fhFY8FxlOOeBbIAoHT1n280Sw+QcBnuLOnEgC1cRl0ARUC5bbnGR8NDRUeK5kAakMN7vBUGHre/awpfaGibm2CKawzS1lAAdpe4jj/gv1aXMPq6MjTC+3DJjIU/fNwRM/vbk6eYYQdF+0BijxgNVdURG8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068826; c=relaxed/simple;
	bh=qFM6CNejT4/x2PsTY7g3d31KNjCWnVMll1bNFh52yVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ksX5i7gctv404eX0SnNA2AgNOhLFGOEyb/KglCgAC5CaD9RtJ7jBwIeQENA0XRtC2UkrrhwFVL6GaFplwxaNDl2LtJqa3sp+/WMSzluMXTpf3y3hEeKSvRyeCzkAdR3ZIXKnOtxGx+PHTykWDkkBRlNHd2xScDRX8FS3GisAO0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=otWykjxB; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="otWykjxB"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a107b387a5so6891963e87.2
        for <loongarch@lists.linux.dev>; Mon, 09 Mar 2026 08:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773068823; cv=none;
        d=google.com; s=arc-20240605;
        b=h0Zmp8+Fzb0thu3NfXk2jdl2L9gQxDmUcCIt67Uhf/2nv+QazIqzx6edtl3b0NxNlA
         iMyrPzRiyFL9sl8OQ7VqZO6jMHxf21ErobMqNiDGAD4q+bix3bpZJFU76IuwO5QOPpfe
         E6NrAGPUlU1SA7P1CpKpgAuUh7xPVzYxroylFPYkRW2b/1T2opoHd4JQxJazCFpOGgpM
         sf7wf40iD5NbbeLc3ovH657mwKCoTm2jWkmKTr6Wem+QDyYviyqmMA9cLtLOs/BNjMo0
         J0gVQVAaTzG46hgRnOg3znWzeK1t+kx7ocxY8QiVH1Oi97v+t/mXcv86TeG9nrHNP0wg
         HgTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=537JRIZC/LSxbuaPx2Afp8DiB6T1dTDgqpkX2JrxqlU=;
        fh=3l+gOL8cxWpnza2m1kHdDgBAZ3dQZgAWVqkMg5VBFzE=;
        b=WGaru8yk71dFyJGKVQ3stO7C2BX6RI+5CvuhTPiCntHcbYrAn5G8+dSzHxj4OqmdFX
         o6lKBtMurb7u2vh/xBUzr6WMKdrZ4LJB+phkdEjqFZwdRlmEbJr3vic4OeraMWBUDQXa
         FYsQl1BdQ31Qo6hDXK6dQ/+sM2ZClzvcOdvoQ9m1H4rdSEcUpDGQBIjgwNUB6dHzGMk4
         1DSJK21lhwlbb5j7PgikEI9ndEihC3WHc8VYg0h9mxyAJI302/slpbfbHPE7QXNzfhBn
         3uDNIkQNzOexbYe4I4NbtzbfZgMiF5LXkOEt4Wy5uyUjUipXTBPa1651w2RgBODWJnf1
         olzw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773068823; x=1773673623; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=537JRIZC/LSxbuaPx2Afp8DiB6T1dTDgqpkX2JrxqlU=;
        b=otWykjxBDV6z9PZruBZ4zZGYfKWUoGruaGgENkh1LocGaRPOKFddIX5JvSyyOVaK6Q
         mssUCOwwrXTdlgwhCk4Kbd21jJVb6a4ALu2IFKCcEEsduh0RZFhf6FzvNSap2bCsshMV
         ckzWUYTEUPJNNZCwXkRVlbCQoptV2CwkZ5Cp49wcV+GEmnRLQf7/WAcuB170IXjfQE6H
         hk/ZsRrWdL7qU++sTPs98iP5DvteDtB8J0jssAiIkVLfLF30G8FWZB3D5AGui0cCGE3t
         IoNWi+WklQZ4SCXvF1b2r4moK+/qpqcTIF2oyrNbwMau6QTgdQBX/IEANHAiy4ZB1sHJ
         qm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068823; x=1773673623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=537JRIZC/LSxbuaPx2Afp8DiB6T1dTDgqpkX2JrxqlU=;
        b=s0z75r6/WBRfoHLzCB/f3nHO4k7bFzvDCw1eAUCkvZd8QXe8WzPBAQdnHUFoBoSARX
         1ssk8vmvLpBo3NnQDRiYEtHof4utVfukb/37tqyyEE2YNnT9Wqy59UfXyMm3GDTbTD1U
         YISpz2a5f4YIv/1N2Uf21bvOFhYUrwFoRCQZn0M1txlNUAI+aPzDy71wq0fVomNt/NMB
         mHWNHUEv11T6lSUTVTtSm0SJsC+RmGJHsIQjAcJIm8JRZLtRAAxkQBxdynNA7Ybdfksg
         zbdnL+HoxbX9ZhHtK5x5g1Qx1Emdu3rUrNBMDVjraRhgXgsAGeQT/AeZCT6QWzgbxxc6
         CJkA==
X-Forwarded-Encrypted: i=1; AJvYcCXzElrRM3WaIDS1bMoSZTjixS7Ig/fS1ahYHhmiy1Wmz9YQiq+Q449h1hGhF5/dSD2JHfa2CmYKFbg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5GyyZBjbH7Pvhq31f/my40rS+WFkHuHxetvOTfaZIEWpdD7FK
	uXfnGiTBKnq8e/b5NdBG/srfzLvEiOhDSXJKsrwLKeP8csgp+Iqryf2irZzoI96HBxTUUm0lm0K
	kQnH3r76pFnDaAVRMVsoYGDFXrYsM8TMGdEv7UyNRDw==
X-Gm-Gg: ATEYQzye0/TWBvt3GNnJ/nYYUK9v2FajaK+CT9Ik742OkuWyWYxFKsl2pJiuEny+XjD
	X2rWznsBqlqWNUFHCvgkPzeW+plN+zpj7gVa0G9tPS4OHSZ1VJicc8dac/KM7hULYZ6Ivy/vLIw
	LgHdlA7HEcqzrL0HWsaNcY8HmEdgGbX/r8c1Gd1Qc24aZvo6xga3848mtYOLbr2I2tDcWsMRzJO
	AGiGOA8v5QTL4cWWSBG+BQ9cbn8xybgj7Q+MRITIyBmrAk3K+Oz44Vt48qVVT13xxk8olf0wF3E
	Gad/gIV+
X-Received: by 2002:a05:6512:1050:b0:5a1:427d:93cb with SMTP id
 2adb3069b0e04-5a1427d98a9mr2810827e87.3.1773068822670; Mon, 09 Mar 2026
 08:07:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1772529875.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1772529875.git.zhoubinbin@loongson.cn>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Mar 2026 16:06:26 +0100
X-Gm-Features: AaiRm500LV8TdcWOE41CkNJVMFJZsV23MQAFkPUmS9M5shGF6D8S5Byz54gpLEA
Message-ID: <CAPDyKFqi_p0YDDebvjhAeC8fiq0KidE_pmbvBcvGDiUEStWvrA@mail.gmail.com>
Subject: Re: [PATCH 0/3] mmc: Add Loongson-2K0300 SD/SDIO/eMMC controller support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Mar 2026 at 12:27, Binbin Zhou <zhoubinbin@loongson.cn> wrote:
>
> Hi all:
>
> The patchset describes two MMC controllers of the Loongson-2K0300 SoC,
> one providing an eMMC interface and the other exporting an SD/SDIO
> interface.
>
> Its hardware design is similar to that of the Loongson-2K2000, but it
> suffers from hardware defects such as missing CMD48 interrupts.
>
> Thanks.
> Binbin
>
> Binbin Zhou (3):
>   dt-bindings: mmc: loongson,ls2k0500-mmc: Add compatible for
>     Loongson-2K0300
>   mmc: loongson2: Gathering all SoCs private data together
>   mmc: loongson2: Add Loongson-2K0300 SD/SDIO/eMMC controller driver
>
>  .../bindings/mmc/loongson,ls2k0500-mmc.yaml   |  1 +
>  drivers/mmc/host/loongson2-mmc.c              | 59 ++++++++++++++-----
>  2 files changed, 44 insertions(+), 16 deletions(-)
>
>
> base-commit: 6a4a4c1cc0012590b8bebf6c95d51687d39b420c
> --
> 2.52.0
>

The series applied for next, thanks!

Kind regards
Uffe
