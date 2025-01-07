Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA881F7550;
	Tue,  7 Jan 2025 21:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285151; cv=none; b=dtBGMn3Lo+H+ztgAvcDK5SnSvxXOLhwRtZVtXrwaBStR5Jo8NRBSY5fy3ZPi2FX9C/9gFErSMFEDr4I6sXh1ExB5ssEyxh6UmIe0pQULuJuyDQeYk0SEX6LwBcTh4xt9wbB6zsVFmxB4J/rMJgs3Sf8bZOfUef86FiDGGxoBb/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285151; c=relaxed/simple;
	bh=e81pooNpNJTl+Sg0K/oySV/OHUC8eHQd0dPPJ6IdfR0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=m6HEVJ0gvos4Jes5M4xrb1RwTIoWDT7ILGz2soC62OjQ5Qzrlc/HSGPCW7ngz5Pc3Zh1NlO3GKBBF9620DiEONDh0ZqTVJJ8A/y7hMQgmr1U+fh3r2NCdMbGVbCONwW9hMAqNa5YgLCFkgA6ssM7yHvsIGdkRZJJhiUIlBhdOpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=asDT4T4z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="asDT4T4z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B37C4CED6;
	Tue,  7 Jan 2025 21:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736285150;
	bh=e81pooNpNJTl+Sg0K/oySV/OHUC8eHQd0dPPJ6IdfR0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=asDT4T4zzglUJJu/i24gbAfWoF2a+fjkqpB6jn38Wf3NE7EK1IYHJg4nXP/TshM/O
	 DdRPaYPrLIt4mMLOYC1LM0o/8i2YQ/IVlB/cIkURoWNRPsgGjzXNd0BA89LJjal9to
	 mr5wQfVAAnn+w36CJFbxpusNKTfCPe+gDTTstVV+ACYfSbOGjW2RCgO0mWHPAe3ytm
	 +ExY26o9OBNesFCSFpIdq3vxBRoBT3gN2gUdwJTrOrl3srp7SjszJsoueQpkkQQ9l/
	 uRaZ3JUvPYeu2JMQu7QEn+yC5JvX5GACypxPaIfS9xEUgtU8kPvxG0NK4N3M+uuZ+p
	 QMwAcFM5moIyQ==
Message-ID: <526d7ad1f0b299145ab676900f81ba1a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241225060600.3094154-1-zhoubinbin@loongson.cn>
References: <20241225060600.3094154-1-zhoubinbin@loongson.cn>
Subject: Re: [PATCH] clk: clk-loongson2: Fix the number count of clk provider
From: Stephen Boyd <sboyd@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, linux-clk@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, Binbin Zhou <zhoubinbin@loongson.cn>, stable@vger.kernel.org
To: Binbin Zhou <zhoubb.aaron@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, Michael Turquette <mturquette@baylibre.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Date: Tue, 07 Jan 2025 13:25:48 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Binbin Zhou (2024-12-24 22:05:59)
> Since commit 02fb4f008433 ("clk: clk-loongson2: Fix potential buffer
> overflow in flexible-array member access"), the clk provider register is
> failed.
>=20
> The count of `clks_num` is shown below:
>=20
>         for (p =3D data; p->name; p++)
>                 clks_num++;
>=20
> In fact, `clks_num` represents the number of SoC clocks and should be
> expressed as the maximum value of the clock binding id in use (p->id + 1).
>=20
> Now we fix it to avoid the following error when trying to register a clk
> provider:
>=20
> [ 13.409595] of_clk_hw_onecell_get: invalid index 17
>=20
> Fixes: 02fb4f008433 ("clk: clk-loongson2: Fix potential buffer overflow i=
n flexible-array member access")
> Cc: stable@vger.kernel.org
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---

It's common practice to Cc the author of a patch in Fixes. Please do it
next time.

>  drivers/clk/clk-loongson2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
> index 6bf51d5a49a1..b1b2038acd0b 100644
> --- a/drivers/clk/clk-loongson2.c
> +++ b/drivers/clk/clk-loongson2.c
> @@ -294,7 +294,7 @@ static int loongson2_clk_probe(struct platform_device=
 *pdev)
>                 return -EINVAL;
> =20
>         for (p =3D data; p->name; p++)
> -               clks_num++;
> +               clks_num =3D max(clks_num, p->id + 1);

NULL is a valid clk. Either fill the onecell data with -ENOENT error
pointers, or stop using it and implement a custom version of
of_clk_hw_onecell_get() that doesn't allow invalid clks to be requested
from this provider.

> =20
>         clp =3D devm_kzalloc(dev, struct_size(clp, clk_data.hws, clks_num=
),
>                            GFP_KERNEL);
