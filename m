Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EFE4D5A0
	for <loongarch@lists.linux.dev>; Tue,  2 Apr 2024 08:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712048300; cv=none; b=lfnY6SFZD7jpQxutyVqq0O0OxJQn1/lbZmiYnKzioeqKWsokHjQA0fbRIwgF5jea9wOLNZ4PE+FGulp6JFWlYrpHGXuL97sZoQITQ9/SJAfnRspi+7tZcFjd8HV7z8Lbxlw2I/B+dPWgEjVegrbQhPw6UNYcBQKXatjEANYbivk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712048300; c=relaxed/simple;
	bh=GJGmzl0aL+gzIiSBt4ML2aSlp8l0BachOvAUaE+pSVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQfSWF+l+4DtcplcoKyOZlVL2OhQsK4ggspib5gs6NkFpiE8NQqei2uMcQHG4AWsyd4uLdCuGWOsIBw3dUwZNlgI4BrKtk+uUibpm9OXUXjfo4A7isZJyu3ykreGwvHBUseoTuRVaaoFBk5bblCNuKCOBXZ7K0a90NDGj5w36CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kly8A2Cb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kly8A2Cb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777C7C433B1
	for <loongarch@lists.linux.dev>; Tue,  2 Apr 2024 08:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712048300;
	bh=GJGmzl0aL+gzIiSBt4ML2aSlp8l0BachOvAUaE+pSVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kly8A2Cbd2xiawQe95+Q1TL8CHnPoTknmbeJJg1nPbgipm3JjOOXN+Qvbilm0VdZb
	 nNThpyysjqt1D36FQ/wfzJ7JBGTbmgKkTZ2+2lgwnP49xW0enjnr1dL7w8+R+Ip7QL
	 RaLn0po1LDIuwKHAMWdGuLbXX8OTDzh1tAKWj9Fgqy8grIl17ODuNE5taV0ZfjjETe
	 zDSHkYYyWD8VAFTbYMFs0jXS8kHImNAdOxRtHvo5gswaDyt9p5DvBDN6anTgR+c+Tx
	 1m4TRmBsZNMz6UA7VljAaLATEMEFWkPCgHkYkDP55z+IfEOPD5M/hA8T5ZgAW6T3DR
	 huK1v+mG45XNQ==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a4715d4c2cbso644132166b.1
        for <loongarch@lists.linux.dev>; Tue, 02 Apr 2024 01:58:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXcqMJ1HZRslTlGjjITU9RZPb2JH+4hS1XivesnK8tGojUu3KxPjmWAWO5iYsOzJtJUUERcxhkJj8n3+6DpLWYEhZ7FO06OmzDv
X-Gm-Message-State: AOJu0Yzgb145wEZPELv848Y7heqajQx/zvHNZOleZD6p6rlNpVLPJEpu
	4LXdXdI66O8OexgmDLzvPzPmK2icbYEsbz3azmj5eFfDheu0rhXJEXVdd332I14/RPH/mDQ0wtj
	/1kUytd0NXPsDXJ8fVc/E7nHKuDM=
X-Google-Smtp-Source: AGHT+IEfJymNSCKTkckJk4CVDKDysHoRh7f7lkdWF/dzcc7jIH3lmiAijIS62CiVN1IntvEEPTIrdaOmJbHI8fQT8z4=
X-Received: by 2002:a17:907:9702:b0:a4e:39f1:6374 with SMTP id
 jg2-20020a170907970200b00a4e39f16374mr7328586ejc.24.1712048298982; Tue, 02
 Apr 2024 01:58:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1711504700.git.zhoubinbin@loongson.cn> <6c4eb239cbde62e7e1a8c647c945e128a0b78b2b.1711504700.git.zhoubinbin@loongson.cn>
In-Reply-To: <6c4eb239cbde62e7e1a8c647c945e128a0b78b2b.1711504700.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 2 Apr 2024 16:58:07 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5L=ff8k4a5PA7vaD5W8QRu3zWQa=-99bq4MsjUz3UQJQ@mail.gmail.com>
Message-ID: <CAAhV-H5L=ff8k4a5PA7vaD5W8QRu3zWQa=-99bq4MsjUz3UQJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: add Loongson-2K expand clock index
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, loongson-kernel@lists.loongnix.cn, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Binbin,

On Mon, Apr 1, 2024 at 4:24=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
>
> In the new Loongson-2K family of SoCs, more clock indexes are needed,
> such as clock gates.
> The patch adds these clock indexes
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  include/dt-bindings/clock/loongson,ls2k-clk.h | 56 ++++++++++++-------
>  1 file changed, 37 insertions(+), 19 deletions(-)
>
> diff --git a/include/dt-bindings/clock/loongson,ls2k-clk.h b/include/dt-b=
indings/clock/loongson,ls2k-clk.h
> index 3bc4dfc193c2..4e6811eca8c6 100644
> --- a/include/dt-bindings/clock/loongson,ls2k-clk.h
> +++ b/include/dt-bindings/clock/loongson,ls2k-clk.h
> @@ -7,24 +7,42 @@
>  #ifndef __DT_BINDINGS_CLOCK_LOONGSON2_H
>  #define __DT_BINDINGS_CLOCK_LOONGSON2_H
>
> -#define LOONGSON2_REF_100M                             0
> -#define LOONGSON2_NODE_PLL                             1
> -#define LOONGSON2_DDR_PLL                              2
> -#define LOONGSON2_DC_PLL                               3
> -#define LOONGSON2_PIX0_PLL                             4
> -#define LOONGSON2_PIX1_PLL                             5
> -#define LOONGSON2_NODE_CLK                             6
> -#define LOONGSON2_HDA_CLK                              7
> -#define LOONGSON2_GPU_CLK                              8
> -#define LOONGSON2_DDR_CLK                              9
> -#define LOONGSON2_GMAC_CLK                             10
> -#define LOONGSON2_DC_CLK                               11
> -#define LOONGSON2_APB_CLK                              12
> -#define LOONGSON2_USB_CLK                              13
> -#define LOONGSON2_SATA_CLK                             14
> -#define LOONGSON2_PIX0_CLK                             15
> -#define LOONGSON2_PIX1_CLK                             16
> -#define LOONGSON2_BOOT_CLK                             17
> -#define LOONGSON2_CLK_END                              18
> +#define LOONGSON2_REF_100M     0
> +#define LOONGSON2_NODE_PLL     1
> +#define LOONGSON2_DDR_PLL      2
> +#define LOONGSON2_DC_PLL       3
> +#define LOONGSON2_PIX0_PLL     4
> +#define LOONGSON2_PIX1_PLL     5
> +#define LOONGSON2_NODE_CLK     6
> +#define LOONGSON2_HDA_CLK      7
> +#define LOONGSON2_GPU_CLK      8
> +#define LOONGSON2_DDR_CLK      9
> +#define LOONGSON2_GMAC_CLK     10
> +#define LOONGSON2_DC_CLK       11
> +#define LOONGSON2_APB_CLK      12
> +#define LOONGSON2_USB_CLK      13
> +#define LOONGSON2_SATA_CLK     14
> +#define LOONGSON2_PIX0_CLK     15
> +#define LOONGSON2_PIX1_CLK     16
> +#define LOONGSON2_BOOT_CLK     17
> +
> +/* Loongson-2K2000 */
This line should be removed, because the below definition is not
specific to Loongson-2K2000.

Huacai

> +#define LOONGSON2_OUT0_GATE    18
> +#define LOONGSON2_GMAC_GATE    19
> +#define LOONGSON2_RIO_GATE     20
> +#define LOONGSON2_DC_GATE      21
> +#define LOONGSON2_GPU_GATE     22
> +#define LOONGSON2_DDR_GATE     23
> +#define LOONGSON2_HDA_GATE     24
> +#define LOONGSON2_NODE_GATE    25
> +#define LOONGSON2_EMMC_GATE    26
> +#define LOONGSON2_PIX0_GATE    27
> +#define LOONGSON2_PIX1_GATE    28
> +#define LOONGSON2_OUT0_CLK     29
> +#define LOONGSON2_RIO_CLK      30
> +#define LOONGSON2_EMMC_CLK     31
> +#define LOONGSON2_DES_CLK      32
> +#define LOONGSON2_I2S_CLK      33
> +#define LOONGSON2_MISC_CLK     34
>
>  #endif
> --
> 2.43.0
>
