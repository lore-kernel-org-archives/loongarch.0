Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAC6155757
	for <loongarch@lists.linux.dev>; Mon, 15 Jun 2026 01:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781487370; cv=pass; b=m6WxDVHw/Te6JV/O6+F5SDr30w5fVc0artLUxL8om8UWd5UjlvrpqzK7M1qYRj6HPLteFxHKtvIV2bDDoewumoFw/IMQMCwV3khxarZ/0+se1O4zJ1BM6Rx8DwlRZoaFOVr+Z2Decp9Y08RoM06WySRSZx9pGbX1t2ZRc3IC82c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781487370; c=relaxed/simple;
	bh=bEBrUd8SOrrpb9rETyLLoTj3LaH2mvvFi00GIMd2YdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Alyk8jp+8W35ICxSIDi373GsMdDXqh0B8oRBiLoipDTqh/B4zPXK/2sff/f+BJnqBASWzNt0kN/YsplpAopJP9pppI3zp8nBbDtwbFyPFjpIXFuHjD7NSb7wyr86n1CD9vBcSFn2MhyuFmWJeWYLu8zC/SX2flDRUtwCXrbzIOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UiMGweeQ; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UiMGweeQ"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bebac79fff8so333395266b.0
        for <loongarch@lists.linux.dev>; Sun, 14 Jun 2026 18:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781487366; cv=none;
        d=google.com; s=arc-20240605;
        b=QsXI23xj8ChOxdxQgLYRVdB2zjaFyn+nNwYlMU0Ito4qbJFXEsB0o+TIRoN4Htc99G
         S7C2z8g4Zed0K2q2rUmfnYabjIE4KuTJnRrY0nzff3DtAaHdX2DdZ0luJW+j8F8E50z3
         8UN7xQarPjnBNjT5LvsI/P7EJpOVBrWWRVXNYTtqDYoMbC99sTrJ/MqUvP2qcSDFFc87
         QycC3jh9fSpKavXTzM8ae9jEXlw2lNv4y+mbCtYj5CIQXVmMK2Q0Ba586+aQf+nWosnC
         6JTHFCZ/kgc6e8E0lcHAm2PrpQ1nNLnlUxgjcZfmsPYXysN1rAkofhkfGExmYxlcPq4w
         UwjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cqv6eWBfXzr3Unk1jrSaSoRQGgcoKVADrv4U4jV3v+s=;
        fh=1QJ2r2l79nOJbiTxmdtc3AzBHhUP3Nygjlo8U71N4Pk=;
        b=JYYnZ6w0M/CF982nxHKmsoH39iuUotP18z7dAUUGadkggXQ7cgYmOsl/HBTIwZdG2h
         I0G2+YFoie+eCk4iMTutkAlHgpk9qLmL6GRnastuD/JnqpJ2uQtViRq/3VxGxZbe1C37
         ukezcHKNwx4Y4TsCOIcqtISzpJypaO2bS+C0O0vIVWuo6a8xlzXN3fpMWjz0eTmZzpYR
         EK9qHQZ4A/t8V0kWINeBsIpHyNgtUUQKZi9zAye6EGUFHkHO/BCo3xlfVsjL8Yt2ZIsQ
         7/BGxR3ioIggOPPYXxt1UwQaf56GiVPrH/BeYRBzYBsRadk8062iINAZJ2L21lrOpHCt
         CfOg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781487366; x=1782092166; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqv6eWBfXzr3Unk1jrSaSoRQGgcoKVADrv4U4jV3v+s=;
        b=UiMGweeQ47Up6LWdl7mS90OVUjm+Bh4ltebNTm3hTlwKgt9SPe1eYkuVPVvxwpDBZM
         EDBnoQLSRN2ecDPVhxgfnzi32qmJF2aoKjZW5d6z8JfSzOqpXBCEWKqefHHm6qat8KKW
         Ue8z4SIb1J/Un9KhYFspEjx1EGQ/9V4GArxzOabjZfFeGz7IdtfjJ4XzjmSob/MFtn2n
         lqOjhz0e6H2UV9zyfRRkF7sodxM8GWzzHy9/YgMY6pQH0OoF7eh9L667HmF3eX9adFv5
         LKfeWDkq+nSkVC2kO1UaEoHFv6bsu8dy7FZaQ3+YhIG+ajPUgJbnW84Yq7DghOU3F9JU
         7Jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781487366; x=1782092166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cqv6eWBfXzr3Unk1jrSaSoRQGgcoKVADrv4U4jV3v+s=;
        b=O4xQCMBoI2wgdXlU+8eVn/A3bSGQ+bZl7/VjDWaX5/rauTBJFZ0H5+C20PC1lLUOey
         9xZZaG2LUjgmailcieNhFE0dNkuwl3uR6y8u1LiEY/Tc6aSV80r4SwASxk3Bdu74hxBI
         1bWok72nqy9HWcuZzW1pDR1XJffgfI8BRVX3d4N7rNdzo7+dmPd7kPkiJHAB3eykTNqB
         0YFO9k6Kb6GUep+JGtSlWAw7ywsAAwFDNjMxVj4OGIT+fWSfzZpsARLInIdwUAGmDVfQ
         4rpme4I/4IkogabghWYs+Z5Duegm2Ot1QLkQcZr7EbNo1cdq+S2iEZdDkaDEBocD/oe/
         hPmg==
X-Forwarded-Encrypted: i=1; AFNElJ9cU6UJiNpk/Zj1kSq+NrtZBaqny8ejn28/v4wNR6CT5wLg0rsRNzdE1g9r/4Dj5MnEznYujSR9dxI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9qHu4MmKUvP1jyGuXu2TBrQUYTlfs+n/JwJIxzClz0syVNCa1
	lUVQmn886T3BrupmYdKLBZsJqaGGVsW2CrI1qi/KDqQfLaeD4mLIQA9KcDfSWvzkko19JFVO7V3
	KibyXR+2LUYzs89006+9+bymzD6YgbDk=
X-Gm-Gg: Acq92OHgMIUGeMZgoANuHQjPsOBYhdZCxHDLNuLiT9jmNpgI8bT1RtqHLCNpQkUp1R3
	Lq9mKWXEIJ71W4CvwvReI7bL0ScZwU3s/y6o53ceftc5gbYyMcfRY8frKUDGM9RTevO5Ecq4Owi
	Mh7MLM8weFnK0uw9vELvLtcwAb78nrLgB10+q6V073SNMHhD1A1AaRVwOW1sIutBhvoGFIEw+rt
	K374N62zRcwOOrE7qgwxInav62RutMxuxPKB7vfHoTpmlMBryoq0viJp87kZxjbGX3roef6vEv/
	UWKtfPCjYQ==
X-Received: by 2002:a17:907:1c8e:b0:bd8:6ac6:d722 with SMTP id
 a640c23a62f3a-bfe2a21f835mr609914466b.24.1781487365977; Sun, 14 Jun 2026
 18:36:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1780908445.git.zhoubinbin@loongson.cn> <9af2c912e0afd439ea9562ea8aa72ee0af3f2ed3.1780908445.git.zhoubinbin@loongson.cn>
 <11d8ceff-d05a-4446-96cc-f9f97538d12e@kernel.org>
In-Reply-To: <11d8ceff-d05a-4446-96cc-f9f97538d12e@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 15 Jun 2026 09:35:53 +0800
X-Gm-Features: AVVi8Cd4n8D_IKhiPbABEvcWXLBHTjy9W6E8HJwxG6HVfedPv5nzLR2GlE6Dgl4
Message-ID: <CAMpQs4Kpas0qB=_h3KEJW3WL5i=mZjX53szAhhPrOCo8YKLAYA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] can: loongson_canfd: Add RXDMA support
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Bingxiong Li <libingxiong@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-can@vger.kernel.org, jeffbai@aosc.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vincent:

Thanks for your detailed review and sorry for my late reply.

On Mon, Jun 8, 2026 at 8:13=E2=80=AFPM Vincent Mailhol <mailhol@kernel.org>=
 wrote:
>
> On 08/06/2026 at 10:49, Binbin Zhou wrote:
> > Add optional DMA support for RX path using the Loongson APB CMC DMA
> > engine. When a DMA channel is successfully requested, the driver:
> >
> > - Uses DMA cyclic transfers to write incoming CAN frames directly to
> >   a coherent DMA buffer
> > - Replaces RXBNEI (RX buffer not empty interrupt) with DMADI (DMA
> >   done interrupt)
> > - Dynamically switches between DMA and PIO modes based on channel
> >   availability
> >
> > This significantly reduces CPU intervention under high RX load,
> > especially beneficial for CAN FD at higher data rates.
> >
> > Co-developed-by: Bingxiong Li <libingxiong@loongson.cn>
> > Signed-off-by: Bingxiong Li <libingxiong@loongson.cn>
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
>
> Please check the W=3D2 warnings:

OK. I usually compile with `W=3D1` and didn't notice these issues.
>
>   $ make W=3D12 drivers/net/can/loongson_canfd.o
>     DESCEND objtool
>     INSTALL libsubcmd_headers
>     CC      drivers/net/can/loongson_canfd.o
>   drivers/net/can/loongson_canfd.c:1917:9: warning: missing initializer f=
or field 'driver_data' of 'const struct acpi_device_id' [-Wmissing-field-in=
itializers]
>    1917 |         { "LOON0015" },
>         |         ^
>   In file included from ./include/linux/acpi.h:16,
>                    from drivers/net/can/loongson_canfd.c:8:
>   ./include/linux/mod_devicetable.h:219:24: note: 'driver_data' declared =
here
>     219 |         kernel_ulong_t driver_data;
>         |                        ^~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c: In function 'loongson_canfd_start_xmi=
t':
>   drivers/net/can/loongson_canfd.c:1116:13: warning: 'buf_id' may be used=
 uninitialized [-Wmaybe-uninitialized]
>    1116 |         u32 buf_id, tx_stat, i =3D 0;
>         |             ^~~~~~
>   drivers/net/can/loongson_canfd.c:1116:13: note: 'buf_id' was declared h=
ere
>    1116 |         u32 buf_id, tx_stat, i =3D 0;
>         |             ^~~~~~
>   In function 'loongson_canfd_insert_frame',
>       inlined from 'loongson_canfd_start_xmit' at drivers/net/can/loongso=
n_canfd.c:1144:7:
>   drivers/net/can/loongson_canfd.c:1079:15: warning: 'meta1' may be used =
uninitialized [-Wmaybe-uninitialized]
>    1079 |         meta1 |=3D FIELD_PREP(REG_FRAME_META1_DLC, can_fd_len2d=
lc(cf->len));
>         |               ^~
>   drivers/net/can/loongson_canfd.c: In function 'loongson_canfd_start_xmi=
t':
>   drivers/net/can/loongson_canfd.c:1052:20: note: 'meta1' was declared he=
re
>    1052 |         u32 meta0, meta1;
>         |                    ^~~~~
>   drivers/net/can/loongson_canfd.c: In function 'loongson_canfd_probe':
>   drivers/net/can/loongson_canfd.c:1807:13: warning: 'ret' may be used un=
initialized [-Wmaybe-uninitialized]
>    1807 |         int ret, irq;
>         |             ^~~
>   drivers/net/can/loongson_canfd.c:1807:13: note: 'ret' was declared here
>    1807 |         int ret, irq;
>         |             ^~~
>   drivers/net/can/loongson_canfd.c: At top level:
>   drivers/net/can/loongson_canfd.c:47:9: warning: macro 'LOONGSON_CANFD_R=
X_FR_CNT' is not used [-Wunused-macros]
>      47 | #define LOONGSON_CANFD_RX_FR_CNT        0x50    /* Receive Mess=
age Count Register */
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~

Regarding the definitions of these controller registers, even though
they aren=E2=80=99t currently referenced, can they be retained to make the
code seem more complete?

>   drivers/net/can/loongson_canfd.c:354:9: warning: macro 'LOONGSON_CANFD_=
FRAME_DB_14' is not used [-Wunused-macros]
>     354 | #define LOONGSON_CANFD_FRAME_DB_14      0x3c
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:307:9: warning: macro 'REG_RX_STAT_RXF=
' is not used [-Wunused-macros]
>     307 | #define REG_RX_STAT_RXF                 BIT(1)
>         |         ^~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:255:9: warning: macro 'REG_FIL_A_VAL' =
is not used [-Wunused-macros]
>     255 | #define REG_FIL_A_VAL                   GENMASK(28, 0)
>         |         ^~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:105:9: warning: macro 'REG_MODE_RTSOP'=
 is not used [-Wunused-macros]
>     105 | #define REG_MODE_RTSOP                  BIT(12)
>         |         ^~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:221:9: warning: macro 'REG_RX_FR_CNT_V=
AL' is not used [-Wunused-macros]
>     221 | #define REG_RX_FR_CNT_VAL               GENMASK(31, 0)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:273:9: warning: macro 'REG_FIL_R_HI_VA=
L' is not used [-Wunused-macros]
>     273 | #define REG_FIL_R_HI_VAL                GENMASK(28, 0)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:234:9: warning: macro 'REG_DEBUG_PC_CR=
CD' is not used [-Wunused-macros]
>     234 | #define REG_DEBUG_PC_CRCD               BIT(11)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:249:9: warning: macro 'REG_FRC_FRC_NBT=
' is not used [-Wunused-macros]
>     249 | #define REG_FRC_FRC_NBT                 GENMASK(7, 0)
>         |         ^~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:336:9: warning: macro 'REG_TX_SEL_BUF_=
CNT' is not used [-Wunused-macros]
>     336 | #define REG_TX_SEL_BUF_CNT              GENMASK(7, 4)
>         |         ^~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:218:9: warning: macro 'REG_SSP_CFG_SAT=
' is not used [-Wunused-macros]
>     218 | #define REG_SSP_CFG_SAT                 BIT(10)
>         |         ^~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:91:9: warning: macro 'REG_ID_VER_MAJ' =
is not used [-Wunused-macros]
>      91 | #define REG_ID_VER_MAJ                  GENMASK(31, 24)
>         |         ^~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:359:9: warning: macro 'REG_FRAME_META0=
_ID_EXT' is not used [-Wunused-macros]
>     359 | #define REG_FRAME_META0_ID_EXT          GENMASK(17, 0)
>         |         ^~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:245:9: warning: macro 'REG_TS_PSC' is =
not used [-Wunused-macros]
>     245 | #define REG_TS_PSC                      GENMASK(24, 16)
>         |         ^~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:231:9: warning: macro 'REG_DEBUG_PC_DA=
T' is not used [-Wunused-macros]
>     231 | #define REG_DEBUG_PC_DAT                BIT(8)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:227:9: warning: macro 'REG_DEBUG_STF_C=
NT' is not used [-Wunused-macros]
>     227 | #define REG_DEBUG_STF_CNT               GENMASK(2, 0)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:193:9: warning: macro 'REG_BRE_NORM' i=
s not used [-Wunused-macros]
>     193 | #define REG_BRE_NORM                    GENMASK(15, 0)
>         |         ^~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:238:9: warning: macro 'REG_DEBUG_PC_IN=
T' is not used [-Wunused-macros]
>     238 | #define REG_DEBUG_PC_INT                BIT(15)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:56:9: warning: macro 'LOONGSON_CANFD_F=
LT_B_VAL' is not used [-Wunused-macros]
>      56 | #define LOONGSON_CANFD_FLT_B_VAL        0x74    /* Filter B val=
ue Register */
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:136:9: warning: macro 'REG_CMD_CPEXS' =
is not used [-Wunused-macros]
>     136 | #define REG_CMD_CPEXS                   BIT(7)
>         |         ^~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:126:9: warning: macro 'REG_STAT_PEXS' =
is not used [-Wunused-macros]
>     126 | #define REG_STAT_PEXS                   BIT(8)
>         |         ^~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:78:9: warning: macro 'LOONGSON_CANFD_T=
X_DATA_10' is not used [-Wunused-macros]
>      78 | #define LOONGSON_CANFD_TX_DATA_10       0xd4
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:79:9: warning: macro 'LOONGSON_CANFD_T=
X_DATA_11' is not used [-Wunused-macros]
>      79 | #define LOONGSON_CANFD_TX_DATA_11       0xd8
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:81:9: warning: macro 'LOONGSON_CANFD_T=
X_DATA_13' is not used [-Wunused-macros]
>      81 | #define LOONGSON_CANFD_TX_DATA_13       0xe0
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:83:9: warning: macro 'LOONGSON_CANFD_T=
X_DATA_15' is not used [-Wunused-macros]
>      83 | #define LOONGSON_CANFD_TX_DATA_15       0xe8
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:84:9: warning: macro 'LOONGSON_CANFD_T=
X_DATA_16' is not used [-Wunused-macros]
>      84 | #define LOONGSON_CANFD_TX_DATA_16       0xec
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:85:9: warning: macro 'LOONGSON_CANFD_T=
X_DATA_17' is not used [-Wunused-macros]
>      85 | #define LOONGSON_CANFD_TX_DATA_17       0xf0
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:352:9: warning: macro 'LOONGSON_CANFD_=
FRAME_DB_12' is not used [-Wunused-macros]
>     352 | #define LOONGSON_CANFD_FRAME_DB_12      0x34
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:353:9: warning: macro 'LOONGSON_CANFD_=
FRAME_DB_13' is not used [-Wunused-macros]
>     353 | #define LOONGSON_CANFD_FRAME_DB_13      0x38
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:356:9: warning: macro 'LOONGSON_CANFD_=
FRAME_DB_17' is not used [-Wunused-macros]
>     356 | #define LOONGSON_CANFD_FRAME_DB_17      0x44
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:139:9: warning: macro 'REG_INT_STAT_RX=
I' is not used [-Wunused-macros]
>     139 | #define REG_INT_STAT_RXI                BIT(0)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:267:9: warning: macro 'REG_FIL_C_VAL' =
is not used [-Wunused-macros]
>     267 | #define REG_FIL_C_VAL                   GENMASK(28, 0)
>         |         ^~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:252:9: warning: macro 'REG_FIL_A_MASK'=
 is not used [-Wunused-macros]
>     252 | #define REG_FIL_A_MASK                  GENMASK(28, 0)
>         |         ^~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:292:9: warning: macro 'REG_FIL_CTRL_SF=
A' is not used [-Wunused-macros]
>     292 | #define REG_FIL_CTRL_SFA                BIT(16)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:232:9: warning: macro 'REG_DEBUG_PC_ST=
C' is not used [-Wunused-macros]
>     232 | #define REG_DEBUG_PC_STC                BIT(9)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:59:9: warning: macro 'LOONGSON_CANFD_F=
LT_R_LOW' is not used [-Wunused-macros]
>      59 | #define LOONGSON_CANFD_FLT_R_LOW        0x80    /* Range Filter=
 Low Threshold Register */
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:58:9: warning: macro 'LOONGSON_CANFD_F=
LT_C_VAL' is not used [-Wunused-macros]
>      58 | #define LOONGSON_CANFD_FLT_C_VAL        0x7c    /* Filter C val=
ue Register */
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:235:9: warning: macro 'REG_DEBUG_PC_AC=
K' is not used [-Wunused-macros]
>     235 | #define REG_DEBUG_PC_ACK                BIT(12)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:140:9: warning: macro 'REG_INT_STAT_TX=
I' is not used [-Wunused-macros]
>     140 | #define REG_INT_STAT_TXI                BIT(1)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:57:9: warning: macro 'LOONGSON_CANFD_F=
LT_C_MASK' is not used [-Wunused-macros]
>      57 | #define LOONGSON_CANFD_FLT_C_MASK       0x78    /* Filter C Mas=
k Register */
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:317:9: warning: macro 'REG_TX_STAT_TXS=
' is not used [-Wunused-macros]
>     317 | #define REG_TX_STAT_TXS                 GENMASK(10, 8)
>         |         ^~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:306:9: warning: macro 'REG_RX_STAT_RXE=
' is not used [-Wunused-macros]
>     306 | #define REG_RX_STAT_RXE                 BIT(0)
>         |         ^~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:104:9: warning: macro 'REG_MODE_ITSM' =
is not used [-Wunused-macros]
>     104 | #define REG_MODE_ITSM                   BIT(10)
>         |         ^~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:100:9: warning: macro 'REG_MODE_ROM' i=
s not used [-Wunused-macros]
>     100 | #define REG_MODE_ROM                    BIT(6)
>         |         ^~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:298:9: warning: macro 'REG_RX_MEM_INFO=
_BUFF_SIZE' is not used [-Wunused-macros]
>     298 | #define REG_RX_MEM_INFO_BUFF_SIZE       GENMASK(12, 0)
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:248:9: warning: macro 'REG_FRC_FRC_DBT=
' is not used [-Wunused-macros]
>     248 | #define REG_FRC_FRC_DBT                 GENMASK(15, 8)
>         |         ^~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:230:9: warning: macro 'REG_DEBUG_PC_CO=
N' is not used [-Wunused-macros]
>     230 | #define REG_DEBUG_PC_CON                BIT(7)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:233:9: warning: macro 'REG_DEBUG_PC_CR=
C' is not used [-Wunused-macros]
>     233 | #define REG_DEBUG_PC_CRC                BIT(10)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:198:9: warning: macro 'REG_CTR_PRES_PT=
X' is not used [-Wunused-macros]
>     198 | #define REG_CTR_PRES_PTX                BIT(9)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:124:9: warning: macro 'REG_STAT_EWL' i=
s not used [-Wunused-macros]
>     124 | #define REG_STAT_EWL                    BIT(6)
>         |         ^~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:114:9: warning: macro 'REG_CONF_PEX' i=
s not used [-Wunused-macros]
>     114 | #define REG_CONF_PEX                    BIT(8)
>         |         ^~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:96:9: warning: macro 'REG_MODE_STM' is=
 not used [-Wunused-macros]
>      96 | #define REG_MODE_STM                    BIT(2)
>         |         ^~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:150:9: warning: macro 'REG_INT_STAT_OF=
I' is not used [-Wunused-macros]
>     150 | #define REG_INT_STAT_OFI                BIT(11)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:89:9: warning: macro 'REG_ID_MASK' is =
not used [-Wunused-macros]
>      89 | #define REG_ID_MASK                     GENMASK(15, 0)
>         |         ^~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:194:9: warning: macro 'REG_BRE_FD_DATA=
' is not used [-Wunused-macros]
>     194 | #define REG_BRE_FD_DATA                 GENMASK(31, 16)
>         |         ^~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:270:9: warning: macro 'REG_FIL_R_LOW_V=
AL' is not used [-Wunused-macros]
>     270 | #define REG_FIL_R_LOW_VAL               GENMASK(28, 0)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:261:9: warning: macro 'REG_FIL_B_VAL' =
is not used [-Wunused-macros]
>     261 | #define REG_FIL_B_VAL                   GENMASK(28, 0)
>         |         ^~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:55:9: warning: macro 'LOONGSON_CANFD_F=
LT_B_MASK' is not used [-Wunused-macros]
>      55 | #define LOONGSON_CANFD_FLT_B_MASK       0x70    /* Filter B Mas=
k Register */
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:43:9: warning: macro 'LOONGSON_CANFD_R=
ETX_CNT' is not used [-Wunused-macros]
>      43 | #define LOONGSON_CANFD_RETX_CNT         0x40    /* Retransmissi=
on Count Register */
>         |         ^~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:367:9: warning: macro 'REG_FRAME_META1=
_TIMESTAMP' is not used [-Wunused-macros]
>     367 | #define REG_FRAME_META1_TIMESTAMP       GENMASK(15, 0)
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:229:9: warning: macro 'REG_DEBUG_PC_AR=
B' is not used [-Wunused-macros]
>     229 | #define REG_DEBUG_PC_ARB                BIT(6)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:375:9: warning: macro 'REG_FRAME_TEST_=
FSTC' is not used [-Wunused-macros]
>     375 | #define REG_FRAME_TEST_FSTC             BIT(0)
>         |         ^~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:178:9: warning: macro 'REG_ERL_ERP' is=
 not used [-Wunused-macros]
>     178 | #define REG_ERL_ERP                     GENMASK(7, 0)
>         |         ^~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:378:9: warning: macro 'REG_FRAME_TEST_=
TPRM' is not used [-Wunused-macros]
>     378 | #define REG_FRAME_TEST_TPRM             GENMASK(12, 8)
>         |         ^~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:264:9: warning: macro 'REG_FIL_C_MASK'=
 is not used [-Wunused-macros]
>     264 | #define REG_FIL_C_MASK                  GENMASK(28, 0)
>         |         ^~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:241:9: warning: macro 'REG_DEBUG_PC_SO=
F' is not used [-Wunused-macros]
>     241 | #define REG_DEBUG_PC_SOF                BIT(18)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:290:9: warning: macro 'REG_FIL_CTRL_FR=
FB' is not used [-Wunused-macros]
>     290 | #define REG_FIL_CTRL_FRFB               BIT(14)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:288:9: warning: macro 'REG_FIL_CTRL_FR=
NB' is not used [-Wunused-macros]
>     288 | #define REG_FIL_CTRL_FRNB               BIT(12)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:244:9: warning: macro 'REG_TS_TIMESTAM=
P' is not used [-Wunused-macros]
>     244 | #define REG_TS_TIMESTAMP                GENMASK(15, 0)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:118:9: warning: macro 'REG_STAT_RXNE' =
is not used [-Wunused-macros]
>     118 | #define REG_STAT_RXNE                   BIT(0)
>         |         ^~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:157:9: warning: macro 'REG_INT_ENA_SET=
' is not used [-Wunused-macros]
>     157 | #define REG_INT_ENA_SET                 GENMASK(12, 0)
>         |         ^~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:299:9: warning: macro 'REG_RX_MEM_INFO=
_MEM_FREE' is not used [-Wunused-macros]
>     299 | #define REG_RX_MEM_INFO_MEM_FREE        GENMASK(28, 16)
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:161:9: warning: macro 'REG_INT_MASK_CL=
R' is not used [-Wunused-macros]
>     161 | #define REG_INT_MASK_CLR                GENMASK(28, 16)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:281:9: warning: macro 'REG_FIL_CTRL_FB=
NE' is not used [-Wunused-macros]
>     281 | #define REG_FIL_CTRL_FBNE               BIT(5)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:279:9: warning: macro 'REG_FIL_CTRL_FA=
FE' is not used [-Wunused-macros]
>     279 | #define REG_FIL_CTRL_FAFE               BIT(3)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:123:9: warning: macro 'REG_STAT_TXS' i=
s not used [-Wunused-macros]
>     123 | #define REG_STAT_TXS                    BIT(5)
>         |         ^~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:80:9: warning: macro 'LOONGSON_CANFD_T=
X_DATA_12' is not used [-Wunused-macros]
>      80 | #define LOONGSON_CANFD_TX_DATA_12       0xdc
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:82:9: warning: macro 'LOONGSON_CANFD_T=
X_DATA_14' is not used [-Wunused-macros]
>      82 | #define LOONGSON_CANFD_TX_DATA_14       0xe4
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:70:9: warning: macro 'LOONGSON_CANFD_T=
X_DATA_2' is not used [-Wunused-macros]
>      70 | #define LOONGSON_CANFD_TX_DATA_2        0xb4
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:74:9: warning: macro 'LOONGSON_CANFD_T=
X_DATA_6' is not used [-Wunused-macros]
>      74 | #define LOONGSON_CANFD_TX_DATA_6        0xc4
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:75:9: warning: macro 'LOONGSON_CANFD_T=
X_DATA_7' is not used [-Wunused-macros]
>      75 | #define LOONGSON_CANFD_TX_DATA_7        0xc8
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:77:9: warning: macro 'LOONGSON_CANFD_T=
X_DATA_9' is not used [-Wunused-macros]
>      77 | #define LOONGSON_CANFD_TX_DATA_9        0xd0
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:291:9: warning: macro 'REG_FIL_CTRL_FR=
FE' is not used [-Wunused-macros]
>     291 | #define REG_FIL_CTRL_FRFE               BIT(15)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:335:9: warning: macro 'REG_TX_SEL_BUF_=
SEL' is not used [-Wunused-macros]
>     335 | #define REG_TX_SEL_BUF_SEL              GENMASK(3, 0)
>         |         ^~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:134:9: warning: macro 'REG_CMD_RXFCRST=
' is not used [-Wunused-macros]
>     134 | #define REG_CMD_RXFCRST                 BIT(5)
>         |         ^~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:147:9: warning: macro 'REG_INT_STAT_BS=
I' is not used [-Wunused-macros]
>     147 | #define REG_INT_STAT_BSI                BIT(8)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:99:9: warning: macro 'REG_MODE_TTTM' i=
s not used [-Wunused-macros]
>      99 | #define REG_MODE_TTTM                   BIT(5)
>         |         ^~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:51:9: warning: macro 'LOONGSON_CANFD_T=
X_FRM_TST' is not used [-Wunused-macros]
>      51 | #define LOONGSON_CANFD_TX_FRM_TST       0x60    /* Transmit Mes=
sage Debug Register */
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:206:9: warning: macro 'REG_RETX_CNT_VA=
L' is not used [-Wunused-macros]
>     206 | #define REG_RETX_CNT_VAL                GENMASK(3, 0)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:228:9: warning: macro 'REG_DEBUG_DSTF_=
CNT' is not used [-Wunused-macros]
>     228 | #define REG_DEBUG_DSTF_CNT              GENMASK(5, 3)
>         |         ^~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:199:9: warning: macro 'REG_CTR_PRES_PR=
X' is not used [-Wunused-macros]
>     199 | #define REG_CTR_PRES_PRX                BIT(10)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:142:9: warning: macro 'REG_INT_STAT_DO=
I' is not used [-Wunused-macros]
>     142 | #define REG_INT_STAT_DOI                BIT(3)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:125:9: warning: macro 'REG_STAT_IDLE' =
is not used [-Wunused-macros]
>     125 | #define REG_STAT_IDLE                   BIT(7)
>         |         ^~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:197:9: warning: macro 'REG_CTR_PRES_CT=
PV' is not used [-Wunused-macros]
>     197 | #define REG_CTR_PRES_CTPV               GENMASK(8, 0)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:97:9: warning: macro 'REG_MODE_AFM' is=
 not used [-Wunused-macros]
>      97 | #define REG_MODE_AFM                    BIT(3)
>         |         ^~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:240:9: warning: macro 'REG_DEBUG_PC_OV=
R' is not used [-Wunused-macros]
>     240 | #define REG_DEBUG_PC_OVR                BIT(17)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:310:9: warning: macro 'REG_RX_STAT_RTS=
OP' is not used [-Wunused-macros]
>     310 | #define REG_RX_STAT_RTSOP               BIT(16)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:313:9: warning: macro 'REG_RX_DATA_VAL=
' is not used [-Wunused-macros]
>     313 | #define REG_RX_DATA_VAL                 GENMASK(31, 0)
>         |         ^~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:63:9: warning: macro 'LOONGSON_CANFD_R=
X_PRT' is not used [-Wunused-macros]
>      63 | #define LOONGSON_CANFD_RX_PRT           0x90    /* Receive Buff=
er Pointer Register */
>         |         ^~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:258:9: warning: macro 'REG_FIL_B_MASK'=
 is not used [-Wunused-macros]
>     258 | #define REG_FIL_B_MASK                  GENMASK(28, 0)
>         |         ^~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:289:9: warning: macro 'REG_FIL_CTRL_FR=
NE' is not used [-Wunused-macros]
>     289 | #define REG_FIL_CTRL_FRNE               BIT(13)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:377:9: warning: macro 'REG_FRAME_TEST_=
SDLC' is not used [-Wunused-macros]
>     377 | #define REG_FRAME_TEST_SDLC             BIT(2)
>         |         ^~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:293:9: warning: macro 'REG_FIL_CTRL_SF=
B' is not used [-Wunused-macros]
>     293 | #define REG_FIL_CTRL_SFB                BIT(17)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:294:9: warning: macro 'REG_FIL_CTRL_SF=
C' is not used [-Wunused-macros]
>     294 | #define REG_FIL_CTRL_SFC                BIT(18)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:295:9: warning: macro 'REG_FIL_CTRL_SF=
R' is not used [-Wunused-macros]
>     295 | #define REG_FIL_CTRL_SFR                BIT(19)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:224:9: warning: macro 'REG_TX_FR_CNT_V=
AL' is not used [-Wunused-macros]
>     224 | #define REG_TX_FR_CNT_VAL               GENMASK(31, 0)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:60:9: warning: macro 'LOONGSON_CANFD_F=
LT_R_HI' is not used [-Wunused-macros]
>      60 | #define LOONGSON_CANFD_FLT_R_HI         0x84    /* Range Filter=
 High Threshold Register */
>         |         ^~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:71:9: warning: macro 'LOONGSON_CANFD_T=
X_DATA_3' is not used [-Wunused-macros]
>      71 | #define LOONGSON_CANFD_TX_DATA_3        0xb8
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:73:9: warning: macro 'LOONGSON_CANFD_T=
X_DATA_5' is not used [-Wunused-macros]
>      73 | #define LOONGSON_CANFD_TX_DATA_5        0xc0
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:76:9: warning: macro 'LOONGSON_CANFD_T=
X_DATA_8' is not used [-Wunused-macros]
>      76 | #define LOONGSON_CANFD_TX_DATA_8        0xcc
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:115:9: warning: macro 'REG_CONF_FDRF' =
is not used [-Wunused-macros]
>     115 | #define REG_CONF_FDRF                   BIT(10)
>         |         ^~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:122:9: warning: macro 'REG_STAT_RXS' i=
s not used [-Wunused-macros]
>     122 | #define REG_STAT_RXS                    BIT(4)
>         |         ^~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:303:9: warning: macro 'REG_RX_PTR_RPP'=
 is not used [-Wunused-macros]
>     303 | #define REG_RX_PTR_RPP                  GENMASK(27, 16)
>         |         ^~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:286:9: warning: macro 'REG_FIL_CTRL_FC=
FB' is not used [-Wunused-macros]
>     286 | #define REG_FIL_CTRL_FCFB               BIT(10)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:287:9: warning: macro 'REG_FIL_CTRL_FC=
FE' is not used [-Wunused-macros]
>     287 | #define REG_FIL_CTRL_FCFE               BIT(11)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:121:9: warning: macro 'REG_STAT_EFT' i=
s not used [-Wunused-macros]
>     121 | #define REG_STAT_EFT                    BIT(3)
>         |         ^~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:130:9: warning: macro 'REG_CMD_RXRPMV'=
 is not used [-Wunused-macros]
>     130 | #define REG_CMD_RXRPMV                  BIT(1)
>         |         ^~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:342:9: warning: macro 'LOONGSON_CANFD_=
FRAME_DB_2' is not used [-Wunused-macros]
>     342 | #define LOONGSON_CANFD_FRAME_DB_2       0xc
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:344:9: warning: macro 'LOONGSON_CANFD_=
FRAME_DB_4' is not used [-Wunused-macros]
>     344 | #define LOONGSON_CANFD_FRAME_DB_4       0x14
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:347:9: warning: macro 'LOONGSON_CANFD_=
FRAME_DB_7' is not used [-Wunused-macros]
>     347 | #define LOONGSON_CANFD_FRAME_DB_7       0x20
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:348:9: warning: macro 'LOONGSON_CANFD_=
FRAME_DB_8' is not used [-Wunused-macros]
>     348 | #define LOONGSON_CANFD_FRAME_DB_8       0x24
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:343:9: warning: macro 'LOONGSON_CANFD_=
FRAME_DB_3' is not used [-Wunused-macros]
>     343 | #define LOONGSON_CANFD_FRAME_DB_3       0x10
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:349:9: warning: macro 'LOONGSON_CANFD_=
FRAME_DB_9' is not used [-Wunused-macros]
>     349 | #define LOONGSON_CANFD_FRAME_DB_9       0x28
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:345:9: warning: macro 'LOONGSON_CANFD_=
FRAME_DB_5' is not used [-Wunused-macros]
>     345 | #define LOONGSON_CANFD_FRAME_DB_5       0x18
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:346:9: warning: macro 'LOONGSON_CANFD_=
FRAME_DB_6' is not used [-Wunused-macros]
>     346 | #define LOONGSON_CANFD_FRAME_DB_6       0x1c
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:52:9: warning: macro 'LOONGSON_CANFD_F=
RC_DIV' is not used [-Wunused-macros]
>      52 | #define LOONGSON_CANFD_FRC_DIV          0x64    /* Fractional D=
ivider Ratio Register */
>         |         ^~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:350:9: warning: macro 'LOONGSON_CANFD_=
FRAME_DB_10' is not used [-Wunused-macros]
>     350 | #define LOONGSON_CANFD_FRAME_DB_10      0x2c
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:351:9: warning: macro 'LOONGSON_CANFD_=
FRAME_DB_11' is not used [-Wunused-macros]
>     351 | #define LOONGSON_CANFD_FRAME_DB_11      0x30
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:355:9: warning: macro 'LOONGSON_CANFD_=
FRAME_DB_16' is not used [-Wunused-macros]
>     355 | #define LOONGSON_CANFD_FRAME_DB_16      0x40
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:54:9: warning: macro 'LOONGSON_CANFD_F=
LT_A_VAL' is not used [-Wunused-macros]
>      54 | #define LOONGSON_CANFD_FLT_A_VAL        0x6c    /* Filter A val=
ue Register */
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:237:9: warning: macro 'REG_DEBUG_PC_EO=
F' is not used [-Wunused-macros]
>     237 | #define REG_DEBUG_PC_EOF                BIT(14)
>         |         ^~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:49:9: warning: macro 'LOONGSON_CANFD_D=
EBUG' is not used [-Wunused-macros]
>      49 | #define LOONGSON_CANFD_DEBUG            0x58    /* Debug Regist=
er */
>         |         ^~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:131:9: warning: macro 'REG_CMD_RRB' is=
 not used [-Wunused-macros]
>     131 | #define REG_CMD_RRB                     BIT(2)
>         |         ^~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:302:9: warning: macro 'REG_RX_PTR_WPP'=
 is not used [-Wunused-macros]
>     302 | #define REG_RX_PTR_WPP                  GENMASK(11, 0)
>         |         ^~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:239:9: warning: macro 'REG_DEBUG_PC_SU=
SP' is not used [-Wunused-macros]
>     239 | #define REG_DEBUG_PC_SUSP               BIT(16)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:376:9: warning: macro 'REG_FRAME_TEST_=
FCRC' is not used [-Wunused-macros]
>     376 | #define REG_FRAME_TEST_FCRC             BIT(1)
>         |         ^~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:278:9: warning: macro 'REG_FIL_CTRL_FA=
FB' is not used [-Wunused-macros]
>     278 | #define REG_FIL_CTRL_FAFB               BIT(2)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:276:9: warning: macro 'REG_FIL_CTRL_FA=
NB' is not used [-Wunused-macros]
>     276 | #define REG_FIL_CTRL_FANB               BIT(0)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:277:9: warning: macro 'REG_FIL_CTRL_FA=
NE' is not used [-Wunused-macros]
>     277 | #define REG_FIL_CTRL_FANE               BIT(1)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:282:9: warning: macro 'REG_FIL_CTRL_FB=
FB' is not used [-Wunused-macros]
>     282 | #define REG_FIL_CTRL_FBFB               BIT(6)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:283:9: warning: macro 'REG_FIL_CTRL_FB=
FE' is not used [-Wunused-macros]
>     283 | #define REG_FIL_CTRL_FBFE               BIT(7)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:308:9: warning: macro 'REG_RX_STAT_RXM=
OF' is not used [-Wunused-macros]
>     308 | #define REG_RX_STAT_RXMOF               BIT(2)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:280:9: warning: macro 'REG_FIL_CTRL_FB=
NB' is not used [-Wunused-macros]
>     280 | #define REG_FIL_CTRL_FBNB               BIT(4)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:90:9: warning: macro 'REG_ID_VER_MIN' =
is not used [-Wunused-macros]
>      90 | #define REG_ID_VER_MIN                  GENMASK(23, 16)
>         |         ^~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:62:9: warning: macro 'LOONGSON_CANFD_R=
X_MEM_INFO' is not used [-Wunused-macros]
>      62 | #define LOONGSON_CANFD_RX_MEM_INFO      0x8c    /* Receive Buff=
er Information Register */
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:127:9: warning: macro 'REG_STAT_STCNT'=
 is not used [-Wunused-macros]
>     127 | #define REG_STAT_STCNT                  BIT(16)
>         |         ^~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:236:9: warning: macro 'REG_DEBUG_PC_AC=
KD' is not used [-Wunused-macros]
>     236 | #define REG_DEBUG_PC_ACKD               BIT(13)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:146:9: warning: macro 'REG_INT_STAT_RX=
FI' is not used [-Wunused-macros]
>     146 | #define REG_INT_STAT_RXFI               BIT(7)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:120:9: warning: macro 'REG_STAT_TXNF' =
is not used [-Wunused-macros]
>     120 | #define REG_STAT_TXNF                   BIT(2)
>         |         ^~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:135:9: warning: macro 'REG_CMD_TXFCRST=
' is not used [-Wunused-macros]
>     135 | #define REG_CMD_TXFCRST                 BIT(6)
>         |         ^~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:381:9: warning: macro 'LOONGSON_CANFD_=
ID' is not used [-Wunused-macros]
>     381 | #define LOONGSON_CANFD_ID               0xBABE
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:72:9: warning: macro 'LOONGSON_CANFD_T=
X_DATA_4' is not used [-Wunused-macros]
>      72 | #define LOONGSON_CANFD_TX_DATA_4        0xbc
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:284:9: warning: macro 'REG_FIL_CTRL_FC=
NB' is not used [-Wunused-macros]
>     284 | #define REG_FIL_CTRL_FCNB               BIT(8)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:285:9: warning: macro 'REG_FIL_CTRL_FC=
NE' is not used [-Wunused-macros]
>     285 | #define REG_FIL_CTRL_FCNE               BIT(9)
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/can/loongson_canfd.c:53:9: warning: macro 'LOONGSON_CANFD_F=
LT_A_MASK' is not used [-Wunused-macros]
>      53 | #define LOONGSON_CANFD_FLT_A_MASK       0x68    /* Filter A Mas=
k Register */
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> >  drivers/net/can/Kconfig          |   2 +-
> >  drivers/net/can/loongson_canfd.c | 209 ++++++++++++++++++++++++++++---
> >  2 files changed, 190 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/net/can/Kconfig b/drivers/net/can/Kconfig
> > index 28014e264f30..16e07be6438c 100644
> > --- a/drivers/net/can/Kconfig
> > +++ b/drivers/net/can/Kconfig
> > @@ -191,7 +191,7 @@ config CAN_KVASER_PCIEFD
> >
> >  config CAN_LOONGSON_CANFD
> >       tristate "Loongson CAN-FD controller"
> > -     depends on HAS_IOMEM || COMPILE_TEST
> > +     depends on HAS_IOMEM && (LOONGSON2_APB_CMC_DMA || COMPILE_TEST)
>
> The logic is odd here. If your driver can be COMPILE_TESTed without
> HAS_IOMEM, then patch 1 should be:
>
>         depends on HAS_IOMEM || COMPILE_TEST
>
> and patch 2 should be:
>
>         depends on (HAS_IOMEM && LOONGSON2_APB_CMC_DMA) || COMPILE_TEST
>
> If your driver need HAS_IOMEM even for a compile test, then patch 1
> should be:
>
>         depends on HAS_IOMEM
>
> and patch 2 should be:
>
>         depends on HAS_IOMEM && (LOONGSON2_APB_CMC_DMA || COMPILE_TEST)

For me, the 2nd way is correct.
>
> Here, you are doing a weird mix.
>
> >       select REGMAP_MMIO
> >       help
> >         This is a canfd driver switch for the Loongson platform,
>
>
> Yours sincerely,
> Vincent Mailhol

--
Thanks.
Binbin
