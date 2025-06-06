Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C55288C97
	for <loongarch@lists.linux.dev>; Fri,  6 Jun 2025 13:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749215514; cv=none; b=EMTWxpQgAfRdxsIRVDOI46qaVIYsjhpg1HweYVx0qkY9Wd7E4XoYZtsuM6is8Qp/I5R6aNKABS3NV3EWJFODcRSBG7Q364mrnnZoKj2LzZsFHRRMZBlbWKnyYPCt5FNpOVx8+vSVTWVs4/sAY841dZEFPGYncy6biLmWfCwSR2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749215514; c=relaxed/simple;
	bh=0GVuQojpk9Mb3dzd1WX8x8g8rwjrX/NeL70/4vMlg64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gw+sMEoPR0ACRFvO3OdGGV87SoXb8QObU2YkJPg7uSCj+ejpm4P3v18tMDaTl00NAh0T3tt8RKwxZSPfaH7sTXRSaeM4VmWUcK8ms4wmTXeaJ7sWk6nR6yPX5JDWBblZyERMlJOpHHXz6MXQvQA+Q5ggXHiONfRjTTUbGy++mTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wqt/ynsj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wqt/ynsj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76EC3C4CEF0
	for <loongarch@lists.linux.dev>; Fri,  6 Jun 2025 13:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749215513;
	bh=0GVuQojpk9Mb3dzd1WX8x8g8rwjrX/NeL70/4vMlg64=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Wqt/ynsjKWyHHA0BUkwLgAzqSZSJ6oNIhdNWSYvc5ji+4tUoBOxGAcl3VEriPZ5R1
	 Lh0YS83mMsBfRcIfFOGFIBUzcr95MY/bZKEZlgYdM2SIUQCXCoQriATtNuLK2LHxQZ
	 ynE0Qse9YY4M1J1ciIaoYBFr1DunI3ua/T9GVzWaJZCPAjZNbEbfx1c9ZsCgON8pUV
	 8Czi4NPHjB64wD8vYw/a1A5flQOgL7uNeg38M0GtD83oI8kl7bvY0StB86apFiWeNV
	 9Rsz8aR6zBVRTmXGiMLe7+uh7WodNt497WAdAomZhzs6lzJUhVPx+32H8a/lvwGZ5S
	 rsG6TWi1zfNZA==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60497d07279so3907605a12.3
        for <loongarch@lists.linux.dev>; Fri, 06 Jun 2025 06:11:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmVzkzHSHoGFAmnzyA/+2WZmRhSIaxelpxYsDaF6iPIgDbSw3XXR1Kw4Tl3X2Nb9wQQAIbhfeG9mU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwV6CTkMbdjadvzDyNdlvp52F3D5PXkiRDcpjA+670v+D26Z1T0
	/6p5oCYpXC6SkX6IGOBaHlsGte9qFhZyy1V+90uEBYqrAPtqHsQZPEXux9ibKa66hm2xVVoO56O
	nFQ8TQiWggNGNn7JG2jFL25X7j2HOQeg=
X-Google-Smtp-Source: AGHT+IGkonwhwsMSN2QFCrW9x7bFLMapaDsabxXJgcN7/UazSOBNAAEU4ymwq4ziVNQTZCJ09V22Zkxx/KY4GB20gRc=
X-Received: by 2002:a05:6402:2807:b0:602:2e21:631f with SMTP id
 4fb4d7f45d1cf-6077479a7b0mr2927047a12.24.1749215509801; Fri, 06 Jun 2025
 06:11:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250605054828.15093-1-ziyao@disroot.org>
In-Reply-To: <20250605054828.15093-1-ziyao@disroot.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 6 Jun 2025 21:11:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H58JGB0QoVBC_LE4Mo5gGdZ=-NcH8FtZupK9hxGFdfvMQ@mail.gmail.com>
X-Gm-Features: AX0GCFs_Wi3GPn_-VTaU2yt159R1v2DT0MEdn5mw4mPvCP_UNtgOrgvMGLkiBBo
Message-ID: <CAAhV-H58JGB0QoVBC_LE4Mo5gGdZ=-NcH8FtZupK9hxGFdfvMQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Backlight control improvements for loongson_laptop
To: Yao Zi <ziyao@disroot.org>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Thu, Jun 5, 2025 at 1:48=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:
>
> I've observed strange screen brightness changes on TongFang L860-T2
> 3A5000 laptop after resumption. It's found that a brightness value that
> doesn't match the hardware state before suspension is "restored" for the
> EC, causing the strange behavior.
>
> This series fixes the behavior by obtaining EC's brightness setting
> instead of using a constant as current brightness on probe.
>
> While digging through the code, I've found some unused,
> power-control-related functions in the driver. They're cleaned up and
> used to support power control of backlight in the second patch as well.
>
> Changed from v1:
> - Reword commit message of PATCH 1
> - PATCH 2
>   - Always issue a power-on command on probe to ensure the backlight has
>     been powered, matching our expectation
>   - Cache backlight state in the driver to reduce interaction with EC
> - Link to v1: https://lore.kernel.org/loongarch/20250531113851.21426-1-zi=
yao@disroot.org/
>
> Yao Zi (2):
>   platform/loongarch: laptop: Get brightness setting from EC on probe
>   platform/loongarch: laptop: Support backlight power control
>
>  drivers/platform/loongarch/loongson-laptop.c | 78 ++++++++++----------
>  1 file changed, 39 insertions(+), 39 deletions(-)
>
> --
> 2.49.0
>
