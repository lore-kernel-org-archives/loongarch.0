Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F7030D3FF
	for <loongarch@lists.linux.dev>; Fri, 21 Aug 2026 06:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787295378; cv=pass; b=WPKnGE7EwnlqbuzaFS7vAKViKJbSbYyo1hdRi6zFJI9KFLTl95LCnvk1UVyQEX8kgLnb4EkQZjl8sHdPBjkiJWFyOH5r6HaQM7uPy5sCzUTABylpJiSMXV3GpuYpMxGPTpWDeuZv9V7FsA3/oh+NNH+11/CiJ+w0GDqxU8FGQ+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787295378; c=relaxed/simple;
	bh=pRugMMf7cQy/AulUJSOF0mbQ0113EGSXQNaclE2tc9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6hIJwvL1zSGwtPeNiLb6NU9k71mfJ4dcbJBHDRFPDHlTRXbyFk95VizzLbVMCTU5wXP5iREQWCAK4QdsJ8ssXgBVzZtXY/qldgB3BXv3QyIlHdNyF2b1On3dpg1dP558in7hhq0mICp9nwf0Owdf2SKUztXqk9MOn0KRzOCbyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=gkEAMd5f; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="gkEAMd5f"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2055f5a993so75980366b.2
        for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 23:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787295375; cv=none;
        d=google.com; s=arc-20260327;
        b=i25BFTbJrLriybnqOkx8p+NGD1MVuZvs0GPEKC4vxtzipjSsLWfA1nlI48Xsoy1TJr
         cFYdAgYve+wc3Jvt3PRHjgmgwYAwknKk1pi5DlrVKSj2vACSAhozUJCHvs3qIF243uBj
         MsMvjMgdctwprab3q6vNW0/bysgpJ9rRpaITHRzy/Hsz1r/Fy+7YthzvwCii3a1/w8Xj
         iYiDAajssAssk+sAB04zgsYiTbdOZA5BoGUnQCkz+l4GY9WC8/hAIEBdQzU5MoSVc42H
         N0PkB2K6O6PdlEjTemmQtxPmy6Y0+JwEYgN00se6cKNOQvF+Vp2y3hXkZoKx5OkvhPmV
         rVyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4btvZlASkisNw9ocQY2OC/xtC3q2O98fHaxaVu3itu0=;
        fh=1yRJq3cmSCMhlYpQ23czwHCEDj04BH5sAFlAkTDHdRs=;
        b=JyQhybG3DHJLH7lawsnG0Js8nkb3sFr1CwPsAQ3QnSR5a+6d92H8aC8MSGz0W7CdUB
         McoAlc4aUvfv5djLSumdwvYcT79b9R/l0o9axcVz9sFC3DVBH4jto7xPS4UCr6K5xiwl
         qJYtUmkG9z7v2UbwIPaI7Zvw2BKysJLIfsdTepLYXJKxK46VzBNFWsyowmMyXxbi0IXf
         /e//dDI8RrSvxi3I85a4x/MgNUEG6jIvdp6akWRub7SY1NcZKewVuw/97RMWsN4xUPwY
         xXpeOlJG2sbg6JxKRwPq0Fo9VRPAWIDIpKBHyfQ5RUVPTWfbWlWGLBOZ+73dihW6Opnn
         NFmA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1787295375; x=1787900175; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4btvZlASkisNw9ocQY2OC/xtC3q2O98fHaxaVu3itu0=;
        b=gkEAMd5fdl+Qx6FUkGw9cxpWxXPoeRrs95brs2LWGbenw60m3AXhlmSuuxdkLmNsiR
         7FHMIqgsO66gQqTQLn5pflLdM/n2CZ1SB6J/bLLTxwXSY4R/50VLCrts2iQsVfDPcSa3
         JQtJSAZvkVJc/ehDIidjwb2vlWGa9anJuot72pmFc925jX4fMvGgXLFVbV/BK9h/FfeX
         ea7VKYBWJxD73aR0W0qmawR6zxZ6ojjmaqH6d/81bs5VlLJ0scpks8X/MW0THymwlJ1X
         1jwQBpB6d+UWdf9ib/IyUVfJOc0FkNGuFz4DWi5QFrqTUDFeJoiRLO4SAKU75t5RL99C
         whvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787295375; x=1787900175;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4btvZlASkisNw9ocQY2OC/xtC3q2O98fHaxaVu3itu0=;
        b=EJ7NzfzUcVvnTswyNpLj6WH0do+YecijC8Vq8vISDhYitMisLDvXpGgsqaQxCPUJCy
         JZv9KhpS1QX2Pca9s4rEUP4aAjQ0MmWyJwC1NXWqWWVTPOwV0wBJL3GNgd/e4Zs5sl5q
         WeGxtVMETeMuaoSt2jvnLWgpgd0tTbevl/ypYvpe3/ff5B/vXVynduFxHvq7yGYtWoiD
         EPYNgmRNTI5HcDJFJJ3E6lOUxlIJNAvv2kogBZOhB5+XRb7K1YrFw1CT76G/FPXcjMDv
         sdMNQhkkDatKE+ezITfB7xh/to9hrUDvwnZIX+KkC6htE1+hp0VCs1+cNAHinsqLWSj2
         uojQ==
X-Forwarded-Encrypted: i=1; AHgh+RqxEnGaJDD8Lw6JlbQBTbABUObUc5kUody8YEXU5JdXi4LGMsFNQs/vvQDtQc0NJfEQbSktPWf27uM=@lists.linux.dev
X-Gm-Message-State: AFuF++mrrt/GsGMHX55ItF+i51/93MXWFM0IwiyCpExMKtRVvgVV2G7p
	jUfl0TwBFwd+0QlXA6HDBnkZnt5ivOs53yZABWuM1qllmAdadFIi4J92UplnmvKvJzTa8NRK4pA
	ie+NgoGD2Tsl4S1hzVRH9Om2w6vKxp5wcCLaUtXcB5Q==
X-Gm-Gg: AR+sD12MOcvRWAkYVHm1ZhyxyG+cXCsa4kWsf5Ebh6HAAmW8MXcH6eYhr/rYdFpH+F1
	6CbyPHUez2GpWi3PMTZkfVX96jefzaeL9jkl9Vzns6HCDGqyuj2CNzWqzRg0/hitz6FYj9I6ihw
	Lwnxs1MKblaWmQAtsDcDXpIVfx+L+/eBT8Y70hrsf41C6RNBxHhhDfWPtEwtGKejjRAyvhuhg65
	8RZEoFkIcbvI20HrFDkJ6M8Gu18Gp04B4g5CocFLQnCs/zYQLyQsI2YjGWleNXQh8tUXRl4iw9p
	cYmJTU4GSmxnNLS61Gy/V0xoT1wMmLRsXWp4l4Xtu1jo1l7vLN0qCVQ3i0OWvRnHX43icgpNDx7
	X
X-Received: by 2002:a17:907:7252:b0:c16:8adf:f183 with SMTP id
 a640c23a62f3a-c246a683ff5mr385761466b.14.1787295374985; Thu, 20 Aug 2026
 23:56:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821032702.4258-1-lifangxu22@gmail.com>
In-Reply-To: <20260821032702.4258-1-lifangxu22@gmail.com>
From: WANG Rui <r@hev.cc>
Date: Fri, 21 Aug 2026 14:56:03 +0800
X-Gm-Features: AcwNN1VAsMWBGHA5vFvhzEYs5evQH83OB2bLAaaWqwneLfx2z5VO9rkTvf6PYig
Message-ID: <CAHirt9gpik6SuGSri9yaOhBbuitDeyXrekpQ5=vbN2u-_aSKfg@mail.gmail.com>
Subject: Re: [PATCH] perf build: Add rust target flag for loongarch cross compile
To: Li Fangxu <lifangxu22@gmail.com>
Cc: acme@kernel.org, namhyung@kernel.org, chenhuacai@loongson.cn, 
	peterz@infradead.org, mingo@redhat.com, git@xen0n.name, 
	linux-perf-users@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, lifangxu <lifangxu@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 21, 2026 at 11:29=E2=80=AFAM Li Fangxu <lifangxu22@gmail.com> w=
rote:
>
> From: lifangxu <lifangxu@kylinos.cn>
>
> Based on commit 30f998c992c9 ("tools build: Fix rust cross
> compilation"), add rust target flags for loongarch cross tool to fix
> perf compilation error:
> *** Unknown rust cross compilation architecture loongarch. Stop.
>
> Signed-off-by: lifangxu <lifangxu@kylinos.cn>
> ---
>  tools/perf/Makefile.config | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index 0ba307e78fe1..42c0ef213750 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -1149,6 +1149,8 @@ ifndef NO_RUST
>      RUST_TARGET_FLAGS_s390     :=3D s390x-unknown-linux-gnu
>      RUST_TARGET_FLAGS_x86      :=3D x86_64-unknown-linux-gnu
>      RUST_TARGET_FLAGS_x86_64   :=3D x86_64-unknown-linux-gnu
> +    RUST_TARGET_FLAGS_loongarch :=3D loongarch64-unknown-linux-gnu

This duplicates the earlier patch, which was already Acked:

https://lore.kernel.org/loongarch/20260414080500.320095-1-r@hev.cc/

Best,
Rui

> +
>
>      ifeq ($(RUST_TARGET_FLAGS_$(ARCH)),)
>        $(error Unknown rust cross compilation architecture $(ARCH))
> --
> 2.43.0
>
>
