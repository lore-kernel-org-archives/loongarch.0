Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9788E13DDB8;
	Thu, 11 Apr 2024 07:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712820512; cv=none; b=AdztZsZ7wKZhVbXetJHpxFQDSn26pKpfd2UWlo3qih+7BERF+cLqtR5mUMrxLX3N4Pb+hfwExEOgh+F4tI59XUpA7PRqmafOEAOi5x+KGYPHbFuyI0RWHcetxZfw5vfiP5UZYmkLgSmodvAgp7P6AFdMJMCr24rE3PJGQAC7c9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712820512; c=relaxed/simple;
	bh=SpwLUThuSe0iSjy0+bG0beTilIF19Pllnlt8tkpCy50=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=twOfqSGBnrPYbm2MRDRXZNOr8hjyfbgbApRrB7SC2C3deEvFu4PUt0/AKXgfgzfVh7F3R12yOH8/pZrdz13b5mMagEbvHCbL7FLeh3bSkBDeDQBUt/5ZG6XEpWZFNNeFqy9MRdSSpP3/7C2KW+j8rnemaly7mGDLGfS3eOAqEmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFfkpHtC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFfkpHtC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7342AC433C7;
	Thu, 11 Apr 2024 07:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712820511;
	bh=SpwLUThuSe0iSjy0+bG0beTilIF19Pllnlt8tkpCy50=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dFfkpHtCkL45kp6rA4pgBgyVUSoB1mL6MON1H+dEJIDNhsUnrh91I/rORHdMLDcEo
	 EM4njX49V+eWNfq0gP3EXEcqXfu94Be3uZaXuUi31OqwJvmPDWBbdAZZjqMIj0vhp2
	 nvwq+Lw959AJoTcFA52Q5N6yHbSL9sDYhCovapt1UGnZN56kuFVE/t3zxHTiFYnp4L
	 tNLPRUS3SkiDYbHxYnDhKawtQ/5hOr3GJvnv/0rkKH09Nn/Q+p30hDLHDYHox7PFzC
	 XIqWrNEGhPSFUp0hQ4fmHspiVTTgzQ0AzKr9zEoUbgnj6VA5eKShUSep18hm1n2tMk
	 WT2soBhqL0aTw==
Message-ID: <a39fadac1c4150ca51a8c22d749645e1.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <fb020d1ca19e6f4cdcc95c87b2748869ca76b8ec.1712731524.git.zhoubinbin@loongson.cn>
References: <cover.1712731524.git.zhoubinbin@loongson.cn> <fb020d1ca19e6f4cdcc95c87b2748869ca76b8ec.1712731524.git.zhoubinbin@loongson.cn>
Subject: Re: [PATCH v3 2/6] clk: clk-loongson2: Refactor driver for adding new platforms
From: Stephen Boyd <sboyd@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>
Date: Thu, 11 Apr 2024 00:28:29 -0700
User-Agent: alot/0.10

Quoting Binbin Zhou (2024-04-10 19:58:07)
> The driver only supported loongson-2K1000 at first, but the clock
> structure of loongson-2K0500 and loongson-2K2000 are actually similar,
> and I tried to refactor the whole driver to adjust to the addition of
> the new platform.
>=20
> Briefly, I have divided all clocks into three categories according to
> their properties and their parent clocks: Independent PLLs, clocks based
> on frequency scales, and clock dividers.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/clk/clk-loongson2.c | 459 ++++++++++++++++--------------------
>  1 file changed, 199 insertions(+), 260 deletions(-)
>=20
> diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
> index bacdcbb287ac..ff2ade6a471a 100644
> --- a/drivers/clk/clk-loongson2.c
> +++ b/drivers/clk/clk-loongson2.c
> @@ -6,6 +6,7 @@
> =20
>  #include <linux/err.h>
>  #include <linux/init.h>
> +#include <linux/clk.h>

Why is this included? I removed it and applied to clk-next.
