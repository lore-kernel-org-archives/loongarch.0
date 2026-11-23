Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795426329;
	b=fPGYoReD5Ge1yWDfJpZrHckrZlIIb2Gve0L2EzJMBdx0fgnDsdDDTulBpHW4RsLVMf/1
	 RDFkkUEBhyJ0w3tYYrwFXnucYiBTUEXdYMlSyNHNPKrKUOwaFFJeBTCp7mOtoWn2djces
	 yN2bDx+WocJbk/OFcGF5gePPNAOCUr/u87eFC+DnsE1qYYYZP6evZxd8bz0AMBNZw6tzT
	 Sg08DFhvbX7h2Zdr2FjjcCGRcm7ZaWQ2sqSRrDY+/Jiu5IN+b9N9MCrlUq3EyFILE+I6c
	 dH5NguaxBSY9mFUn2YmAtitClfmcDnSNeDBhx5qHMi4pXxug4YPROi23TaflyecoA9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JqaNNY8+fBRcbsHJnnz48qA9IbD7DLdSU3+18Z2kgkk=;
	b=CM+Lpoxt9sxAZjiHJSIkYVwYoseYOgZ5B3oDMi2uKcomKNmsVEis7JITYir4w9ECmU67
	 3p8DQFKFRJ6sBV5Xj7KqWE4tHbISQMCFHv7JzAi4ZiaXnLi9N6MObV4nR4AUEzIy/lSID
	 MrgdnoSD4xfs5meOf3hjSrFnM4uRh6BxQcZNd6YN4rAMCip8VYn/JStAucG1nGtCjQAeq
	 bPQpcFv8kg8YdfUm9molDMtjivhbVxo3BtG0CjYtiv84qtg9dmd4GclpBTxLZsjPGIDat
	 HxX9UBV07J5RrdMOAH0KjskpGCXpND+Ssu4iSHclUohuzM8Ea13t4RnocOmB4nvYasQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lYcQbQDE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E810606A31F
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 09:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E810606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lYcQbQDE
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d581da0aaso394545266b.2
        for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 01:32:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795426327; cv=none;
        d=google.com; s=arc-20260327;
        b=ioIXxQjMIomHbGKlXKnph82ruGVCsjShdDBtKi3NMa7RTg6j1R6M/KuYEeEbzuMH8t
         9WFFzndF/D3g/lGRNrZZai2NLNFk4vyfttnSQFGZtNeDl6uPTsSIhngPdcH4fb1L8K2w
         Fl3t2jYmNEjp1uhcsggZuP02CzW6/WBHiVNHvbR18QoRJuT9P2VY6MCb9W5OoxnQX5ol
         ZBn2iYQuszHbW3PNjL+3m9HpZKwBWSwcfUMZb19RaJWcOCYm8vJrilEXLB1EFKJcqIUS
         5c77/xTbexTnfZ6wiQXlq73VEfUeJup4eugmmcsKqmvsPOxnGXeSGsaYYc3C4XHZVJhH
         K6Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JqaNNY8+fBRcbsHJnnz48qA9IbD7DLdSU3+18Z2kgkk=;
        fh=jMWGs8j19W0FvgXB2w8IB7H8gYdZmkUNsT72qnreSPE=;
        b=hswKCDKXbJGOeg8/u2bmMoGo7PV7IAk7XJnh4zKgaXvTKSaOp3kqOr3D4CewWUNzhw
         hKAjQWY28/IN0NF68kO+J7EmIJAqNJ8hWYMy94GXrCIW9Gc1pZjCl+rp8vQ26ONPM5P0
         EwpCjDKPwf2j+S0HIFAcmvPmENoXGhlJtW6zAMnEIBRRsTMez82d/eH8+YlqxBxsABwt
         NqepnD0uo8PzJRFhlp3RO7VK/yc9hRvcjaDdmc703+TCDKNobg04eKIXYtDgL1sqSYum
         Hlu6bOFuJnfm2VSPRQOdUOop0t5a/ZNk3viOExMyjDVx+HghyZu8FGy5er0SKNkefTN8
         nq8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795426327; x=1796031127; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JqaNNY8+fBRcbsHJnnz48qA9IbD7DLdSU3+18Z2kgkk=;
        b=lYcQbQDEq+ehCGljEqSMmq8d39H5IwGTiW2vklkNijYCSvkoV5IM3AcIfR8pirm8JS
         vyE45jQQTtN/YtQCkLaKFDTHgLiU0a52eE9WxINVjoOcGDyXpwIPq2VhXMKlfF6MqqNJ
         HO7v2V/P66WkcHpoo7H+3URQjXlnwl45YSz+ssgeu3T6qyTRubD6S49eY+CoM0oPi8fV
         AwDfF5FpRu6pkbY/9EphCq1DkbAmc+56KHxsNRcjnFZtJw3GKDtGLVvyVQzNq+VfL9Hg
         k5Lp9u28kDWUdsqM8PTa/bIaJq4hxH6y0uXtXqTH4HWeCOE5AaniVnIr3+lZiLEiOVXY
         AQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426327; x=1796031127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JqaNNY8+fBRcbsHJnnz48qA9IbD7DLdSU3+18Z2kgkk=;
        b=gzfdU2sBWyuPdQk8WAAAljAyovoRFwM5oHp7KYUsR6NwOReKxfJtcOA/DnLGU9yzZC
         T7p66k01dsSc/f031MBJpUfDclHPr7O/MbVWSz4MKHR6MM0pcC2GYakxna9e3NLbQkcA
         l8HHCrZy3pQGHkF4ItJVMvMVSE8cnN/N5c+DFySzMGTxyBPr2nIs3ADIkrUE+pp9iYIF
         op5+XKSnXr7Mi6Ng8sPBR+GKQtAlWp1gJClQvLpsCgQBbJQhrWmtxf3gED5sRWqYmiBX
         TwmbVStUlFjH/S2wj0KWx0ZJ3iuh+MIMwbGzSj/QctZMbFILkYsfPE+t4woHQz/bpUNT
         hjQg==
X-Forwarded-Encrypted: i=1; AL+hErH7UHwCmJ7EjLy8ckVi0XU3RhRdeDDWneRtxyDC0j7262Cvn/skE8zu0RQ+CBAClD/xGdZl9yhevTc=@lists.linux.dev
X-Gm-Message-State: APuU4Z9pm1vBsPDzt2odx3olcEKJewVRg/aM03MOTo5SrZNYLNmrnDVL
	qNcH/9p7NTYafmXviexHo8sB4hFaIDRF1CskPJ9CRMnjOysxLO5f2jQWcYJTj4OXeEVuV25n2kv
	3uilLyxfJrrXC24EuogEPlbgwNNJ8/sk=
X-Gm-Gg: AZFdTZePSlNc1N/b3laYMoGl1hjij3RP7hdAtfRSJ0R22XrZXSqwnlfdE+I6pTpEJu6
	wmsz7hqYefF64T2au76NI+bx8zk2FU5NjlmSuOPZxTRVm6xxH+Svi5pkUYtsWg4L6YBeU2bZL/M
	u6coBydarvrUmTdUU65QVNheH2fA/+98yfYWDpDHVhrQUMJBSO6DJqNXi9HfApTj1BHwzX1HDsL
	O5PUTbKVDqQl8v1JUE/NRsD+LAa5lM/lwsWyeh+f9ai4XK9j4RUKM6p12qHwT0ohty0XbZdrocu
	y+xLICGWi874Jl6/LZNYQN3aRCb+JBixqRYMsdzhf48+I2awlT2wM6VgvwdqPcTyYeExEyh/xwD
	DI6BGK414jfUOghqbo0vLJlXz0GCv6AOAHLyY
X-Received: by 2002:a17:906:3b04:b0:c29:3c97:c994 with SMTP id
 a640c23a62f3a-c513ab47f35mr695113266b.35.1795426327146; Mon, 23 Nov 2026
 01:32:07 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1792986696.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1792986696.git.zhoubinbin@loongson.cn>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 23 Nov 2026 17:31:54 +0800
X-Gm-Features: Aa3M54rO-ksGTZJl4gmuLyF4LQ_Lpi7KMAzUqlHvweFGPCWngAkxXQw_vYlvNLk
Message-ID: <CAMpQs4KyZbsQO3-kvKrzAVJWEFghpGG7kSmpJvniYeKYaGfanA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add Loongson-2K0300 APB DMA mux support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all:

On Mon, Oct 26, 2026 at 12:33=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
>
> Hi all:
>
> Loongson-2K0300 integrates a CMC DMA controller with 8 physical
> channels. Peripheral DMA requests are not hard-wired to these channels;
> they are routed through the CHIP_CTRL13/14/15 DMA_MAP fields.
>
> This series adds support for that DMA request router.
>
> Patch 1 adds the DT binding constants for the peripheral request IDs
> and yaml file for the DMA mux.
> Patch 2 adds the driver, Kconfig symbol and Makefile entry.
>
> The driver registers with of_dma_router_register(). In the route
> allocation callback it validates the <request> <channel> <flags>
> specifier, programs the SoC-specific route register, and forwards
> <channel> <flags> to the parent CMC DMA controller.
>
> Thanks.
> Binbin.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> V3:
> Patch(1/2):
>  - Merged the two commits containing the dt-binding header file and
>    the YAML file; no other changes were made;
>  - Add Acked-by tag from Conor.
>
> Patch(2/2):
>  - Append the dmamux object to the existing CMC DMA line;
>  - Add loongson2_dmamux_assign_bits() helper, no functional change;
>  - Add Reviewed-by tag from Frank.

Gentle ping.
Any comments about this patchset ?
>
> Link to V2:
> https://lore.kernel.org/all/cover.1791535540.git.zhoubinbin@loongson.cn/
>
> V2:
> Patch(1/3):
>  - Drop LS2K0300_DMA_REQ_MAX as it is not part of the ABI;
> Patch(2/3):
>  - A more detailed description of `dma-cells`;
>  - Add the `dma_requests` constraint
> Patch(3/3):
>  - Drop loongson2_dmamux_map->shift;
>  - Move of_parse_phandle() into loongson2_dmamux_route_allocate() avoid
>    UAF;
>  - Drop loongson2_dmamux->dma_np;
>  - Check dma_requests;
>  - Add devm_add_action_or_reset() instead of .remove();
>  - Replace `metux()` with `spinlock()`, which has lower overhead;
>  - Add loongson2_dmamux_route_free().
>
> Link to V1:
> https://lore.kernel.org/all/cover.1790068409.git.zhoubinbin@loongson.cn/
>
> Binbin Zhou (2):
>   dt-bindings: dma: Document DMA mux support for Loongson-2K0300
>   dmaengine: loongson: Add Loongson-2K0300 APB DMA mux driver
>
>  .../dma/loongson,ls2k0300-dmamux.yaml         |  72 ++++
>  MAINTAINERS                                   |   3 +
>  drivers/dma/loongson/Makefile                 |   2 +-
>  drivers/dma/loongson/loongson2-apb-dmamux.c   | 404 ++++++++++++++++++
>  .../dt-bindings/dma/loongson,ls2k-dmamux.h    |  53 +++
>  5 files changed, 533 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k03=
00-dmamux.yaml
>  create mode 100644 drivers/dma/loongson/loongson2-apb-dmamux.c
>  create mode 100644 include/dt-bindings/dma/loongson,ls2k-dmamux.h
>
>
> base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
> --
> 2.52.0
>
>

--=20
Thanks.
Binbin
