Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC6C3A3E9E
	for <loongarch@lists.linux.dev>; Thu,  9 Apr 2026 08:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722763; cv=pass; b=gqAMfJ0U4FXnHgT4Js9ekq79wU8pwApza50VAZ7klvjsLj/VdMiBRZeqMXZxjxxUdNrqH1tA9yjqB/IV6JPczE7/aNlaRE0QEWZQk2u0oNdBeTr/q2gW9r09Kgrq/b5PDWpgebrxxa8UCSvHvvkQ2wo90VWe4lptIdQpzBOhtiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722763; c=relaxed/simple;
	bh=jHS0ilS7g1CMN5ZK8zes++7dn1FRimCJWBs7yUa4Lxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDRvJVp/Bl4Vc15iEOs40PpaejXv8PmTeFbHEZpmVrPAegsPkNfW17bjuGYoTSOwALRXtlrPiJHkmqlGLyTDPE/6x43qYvZTo1qwXUTM0w8Sq2oVfjUhtpaeMNKaijpoQrTpoSNOSOOb9+x7c2BTv37PafIKpBkJK5OQm2+QcWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jyNERO07; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jyNERO07"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66bf6aa4858so1008193a12.2
        for <loongarch@lists.linux.dev>; Thu, 09 Apr 2026 01:19:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775722761; cv=none;
        d=google.com; s=arc-20240605;
        b=RW1fsBscADz5EJnAkvuY5n/jXKBGp1T4S5sCNqdQYWajYV3j7bKXvavuuKOGXH9JG/
         ySvAaCLVw3DNrN3eicLra3CM1+oHas3I6Bf1siqCvBN07fQ7FHxgArDv1MTzJCQCd+X9
         u44c52N/u8512LltCKVBH218lTvwyuOnVw2XFe6dStOiQnkOMDmbcaTWR6Ue8sYqgO9S
         hm1k0C2N6Uu0P8iD+stM4lTrNKUaNuqdhgi515WUfb8YOKYcY3RR4GXBN4I+3z1XpYlv
         MbRZn1f4oV7BLhU1r1RWCq3qG98Q/OhnU594WHIu08s8jdOkB+9T1kV8ShypunfqDNMo
         8weQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TAxmTNbRbQNg/gEU9ThdCz2lz4k+tx2ML5iFc0liaHs=;
        fh=WOH/MZEeJaaw9fAH/Ll77IaGzPvFQ4Ybxhfugjv8IME=;
        b=F2N90OQu8fDpCxtxVdqr5WWDFO7Z63W6OkjmW0Ms8zPIdJ/OALGmz6d0Yy7s++SXwl
         4CSM8rBfpj04/QNzW8NZeitGII3dQxHuEDZzzcUch/zYCD1CfOptPLfr37/2WN1q5aTH
         RKm3mvIFmYx/cOqDmxiwn5NeILWCLdHQPCRcwOfLM37S0268qRfGI/mFMh2KaSgaN2qx
         GV1/YfyyzxZ7nDORTMjCONmoDNnJuHxKu3/t3gUKkRPaKOtYMZYSYM2Peo6gaaQKBKoa
         HQ8+G3t1cSHQqus0dVusY1wkRxj2Mnr4ecsGo/mhWz6sve6Z1TCYX+F802dRWGkonXvD
         ENhg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775722761; x=1776327561; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAxmTNbRbQNg/gEU9ThdCz2lz4k+tx2ML5iFc0liaHs=;
        b=jyNERO07F78QnnF1vez8XoM0uzFj+Wc0UWUTA9GFp0PU2g+jDwyd8pr0TPtFynCJe3
         BcHuYcOCxr/HZVAp+OZjP4+g8KLst2awCzoa+Lt4AScK0c18x3eJTNz601IDzB3f/jh7
         SdpMNpQCqDsBcVhpLe0JuNr6+zC6+U5raabL/CR/f8ZWCbOodmVzjck4cKqMYAkKmE4F
         4f/+ictkOwJQteO9uI6sk8kNkLzrRJoT05/hMC/5UwbfTq7BmSPOn27qxnxjX9azWx+X
         099ZATXSfT81NHt7RmARvjMNAuPuXnt2tUUMMEaMmjrkbB1zNsZLM4p2u2SzKkFQ8zvQ
         eozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775722761; x=1776327561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TAxmTNbRbQNg/gEU9ThdCz2lz4k+tx2ML5iFc0liaHs=;
        b=bnh0ov3YQcG/3rG3Fqh4x1ActOg4NBrAOFzPtodjtib8B0Ly1tBwxjoQdyiqxkADI9
         UwE0EjuiW4OEghY14d8nLznfsEvvPcohePObJ2Z8TWZROEBqGLqSTrWdDkdgEEiUiHEP
         M7GEImPDyP7xLCAN7nHBp5fcvYkahDq3snOLO0tfJg2K8lGN2J/fFIHtKKSFvgx2WlOB
         FQEfCVRBmALG/WW1cCsBto9eiN/Gauf43ObpRT75yVjqwBemX0xwNJnSb7DHvh1FZj/R
         wScz7ZWqwhshJgRtV/CgpX2O/8fsMoKbcerTbibr7xXbiwmw0Yve+kQDSKsZdu8YKYSW
         HZHA==
X-Forwarded-Encrypted: i=1; AJvYcCWIgcT1vLKG3cmdoXE/hm2Hb5BtWzSAd58jLxm8uWdJtz7SAeiU4UtA4s6seZnUjpGj/DWt0j9LkR4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUAcpBlR+rnPO3ZO/WAGxltJIAf0JW3ZrhcoyQPk8ZwiQOzzgN
	FcRrj9ljoeXg2J6G6SNTIJW47QLGobXm3SDQZF0IF/sMHKoSqGuietioDiSc3JfIsEWfEEdtRZq
	mUoHiuaeBHGv8ZIDg9VUr0BX0/NC6RFo=
X-Gm-Gg: AeBDieuzFOSyU+5Eqjmp94CHbHXXyOLEWKS2zpuYEGehU9fIAKFNjqBbH/xvYDiXSrZ
	2lyLmdVWpCsxWKfHyCxjJC9JNUASBr/6szlJ9p8RWpB/jvjiJlE0vHl5HWb6OPVxzOfx0MPcLsB
	6m4zX8u7lvwhe6KvqF09hPDJJNBuJSTxUmSozxKV4jLXfA312C6SmHCKweZyAH1g7VETbb7i/cE
	ftREM1t1LDANJjqZH6Gu3eZ112qcKZY692gR2RM8unBQMknMyl+asSNQjd5BFkfF/uAMelvDOip
	Yjb40DOm
X-Received: by 2002:a05:6402:4403:b0:66e:aca0:7c28 with SMTP id
 4fb4d7f45d1cf-67003fed4d5mr1344317a12.10.1775722760369; Thu, 09 Apr 2026
 01:19:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773991081.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1773991081.git.zhoubinbin@loongson.cn>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 9 Apr 2026 16:19:08 +0800
X-Gm-Features: AQROBzBKuMNrIJGz8GW32I5rwsJFCx0e5ZCnixWxt1QzwEvhaZPhGrsPHuZHB30
Message-ID: <CAMpQs4KTMKrH3ARzM7iwY6tbQ6Zugyw1AfJAXWRMHk=86ufR5Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] i2c: Add Loongson-2K0300 I2C controller support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Andy Shevchenko <andy@kernel.org>, 
	linux-i2c@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all:

On Fri, Mar 20, 2026 at 3:26=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> Hi all:
>
> This patch set describes the I2C controller integrated the
> Loongson-2K0300 chip.
>
> It has a significantly different design from the previous I2C
> controller(i2c-ls2x), such as support for master-slave transfer mode,
> and  DMA transfers (implementation in progress), etc. Therefore, we try
> to name it i2c-ls2x-v2.
>
> Thanks.
>
> =3D=3D=3D=3D=3D=3D
> V6:
> - Rebase on linux-i2c/i2c-next;
> Patch (2/2):
>   - Update comment;
>   - Use regmap_get_device();
>
> Link to V5:
> https://lore.kernel.org/all/cover.1773142933.git.zhoubinbin@loongson.cn/

Gentle ping.
Any comments about this patchset ?

>
> V5:
> - Rebase on linux-i2c/i2c-next;
> Patch (2/2):
>   - Add time.h header file;
>   - Add the `MHz` suffix to `parent_rate` and `freq`;
>   - Define an iterator within the for loop, with its type being
>     `unsigned int`;
>   - Use dev_err_probe() in loongson2_i2c_adjust_bus_speed();
>   - i2c_adapter_set_node()->device_set_node().
>
> Link to V4:
> https://lore.kernel.org/all/cover.1772714348.git.zhoubinbin@loongson.cn/
>
> V4:
> - Rebase on linux-i2c/i2c-next;
> Patch (2/2):
>  - The parent_rate parameter type should be `unsigned long`;
>  - Drop fallthrough and add missing break;
>  - device_set_node()->i2c_adapter_set_node();
>  - Use i2c_parse_fw_timings();
>  - Use i2c_t.bus_freq_hz instead of priv->speed;
>  - Sperate loongson2_i2c_handle_read() into loongson2_i2c_handle_read()
>    and loongson2_i2c_handle_rx_done().
>
> Link to V3:
> https://lore.kernel.org/all/cover.1772001073.git.zhoubinbin@loongson.cn/
>
> V3:
> - Rebase on linux-i2c/i2c-next;
> Patch (2/2):
>  - Reorder header file follow IWYU principle;
>  - Better indentation and coding style;
>  - Use generic macro definitions;
>  - Amend *all* struct data types;
>  - Correct unreasonable variable type definitions;
>  - Refact loongson2_i2c_isr_error();
>  - of_property_read_u32()->device_property_read_u32();
>  - Remove meaningless blank lines and output.
>
> Link to V2:
> https://lore.kernel.org/all/cover.1769476820.git.zhoubinbin@loongson.cn/
>
> V2:
> Patch (1/2):
>  - Add Acked-by tag from Conor, thanks.
>
> Patch (2/2):
>  - Reorder the definitions of read() and write();
>  - Adjust the calculation method for bus speed.
>
> Link to V1:
> https://lore.kernel.org/all/cover.1763018288.git.zhoubinbin@loongson.cn/
>
> Binbin Zhou (2):
>   dt-bindings: i2c: loongson,ls2x: Add ls2k0300-i2c compatible
>   i2c: ls2x-v2: Add driver for Loongson-2K0300 I2C controller
>
>  .../bindings/i2c/loongson,ls2x-i2c.yaml       |   4 +
>  MAINTAINERS                                   |   1 +
>  drivers/i2c/busses/Kconfig                    |  10 +
>  drivers/i2c/busses/Makefile                   |   1 +
>  drivers/i2c/busses/i2c-ls2x-v2.c              | 544 ++++++++++++++++++
>  5 files changed, 560 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-ls2x-v2.c
>
>
> base-commit: e9b13580b334040da0184a9f32106d808acd7fd5
> --
> 2.52.0
>
--
Thanks.
Binbin
