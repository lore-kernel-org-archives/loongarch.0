Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A2C2ED865
	for <loongarch@lists.linux.dev>; Wed,  3 Sep 2025 10:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756895315; cv=none; b=IQOjAqS2g1EuGaCmnoblqWvqQp38dxkjxlL4mzD2maGoXE6KQe2l6yDNL6+otjaOUKzgieSrwqvTOu7eYmhwFtrPhUIx3lg8zVXB+htamBlyZvi8aqKDUR8lKgWRVHn5BG/seGfGd+E2GNQU7GO+522RzW196qCwCMT/TSqD5o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756895315; c=relaxed/simple;
	bh=MT33R0JtPbGlbxTpxLWmtl9dyNYq9ekSL901r3ltk28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KyC2KAkD4nWRnUepXfpaoLxaE9NxUs+HhckFi5sWNoWfRQqYuGS+OApc4WwgcTJf9TO+aYHYBdmNgRiRj1snXy9q+Vevx9eLFbpCNwdm9wdEHfYxhpPfWozgddsm0PQxZQP1gC8ZKy1Rdxkg3BU+DNtK4e2+Op9PYeBajYO18Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cmx4ufq0; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cmx4ufq0"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-248e01cd834so14852455ad.0
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 03:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756895313; x=1757500113; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/5sRARH/MrxbC7CqhPIy+nQvt4VVCRT77w8qNlk6QY=;
        b=Cmx4ufq0o71jR47+X8q9OxXzCtY7IkJAaM0iGLzCgwQ8pcf7dF6s4OWs/QadIBu7p8
         Z7vv2Rht4X5qzOilYO8X6XRUm37164/kdCWv6jibsW7zXgpwqMKkAJc1yFuS/z9u8xI/
         wJ8uuobttdmEwIKq4gcuoWX37tiOSqmbVoXGaB2usW99AX5loAdjPFafkvPB+ruDM7J5
         b5U+UglXaRluTKF07iN/IadPgfWgwFDYGFfnZ6GlVXsm35rjcKgTRIBhj3kuQkrrWyRe
         s4ABmyNfDwbp8plhRj2yfNNfLGdN2TEJ+YpFpDr4egwllX+dv9Bdl8n/ye5GDg22cuD9
         KKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756895313; x=1757500113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/5sRARH/MrxbC7CqhPIy+nQvt4VVCRT77w8qNlk6QY=;
        b=px0wTTCtfbh4E2QjKsypSeYwf44TxN4L6SBiAHNm0/L3r9JtK561y2T0ZfD49VWiOz
         GrAmzFCb052fgLnxfaFmhPzL/DlhjYmJEbsfosds1KFJrJO6zAOnGWluLN17OTBWPc/C
         JxrpteDjO4p/mWd6sUBp+O3JJxwOVtyLwQvY/qb4octr/QKS6d1SfmFMqmB3AyQz/HK3
         uJ46lOKeVOKVmsUIySJJ1FCk/yi0xHVQC6FBdYofLMxznwl1oZBPrqTYXws0G/XRnM8l
         K9skJLI/gNWfNieKqeA2wHFo3Zt1W/O9Wknj0xEEqQBPLZfnWbGIgkMWlvHO2/okhL/i
         INPw==
X-Forwarded-Encrypted: i=1; AJvYcCVxGnU3jvJcMaaAy9EJDRYcYqG3c0+7ZcntRT+cwVn/gvSP53GGb4mB5erwkkeomy5Sr53Oj7mgtv4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFSlqB2JpMXOAxgqmi+ZaIvoqYmyQLE/sIoa5Tt/M3WXXcvavo
	i7ECtwgvFDFwLX21BWqwJxQgnJZkDpzxPRR7ZxH7m0yyv+jtLo8JttfPXvMp+Pdj/xT1kQ3z6On
	LCAYt9cH96kWwMyiFRCW7sso4UbETi2iHirMqsNk=
X-Gm-Gg: ASbGncsiFI7mBCNnwJ49qyLefFp46aQk7wZAgOo9nXUVAt+LVTVbySvIvUmubZggBMf
	6RYsDE0xx+WlABO9Xjx02ROBK3Epv1Ad88V5E3J1DnunUCHncp7Bch/UCIlqXfagpc5TPFcxmYc
	+NPEdPEBap4iccSqm9OZxdBU7YifJaARjttgrduvU7D7ohimmbuDohOXnLaTG2lDn39vt0YFgTC
	tYiu2JTTxrvcK2M6/ZKBQEZn24UHTGitYPyVLQkkd+RBzflwdZ9EV+s5Q6JxdnX/Skyj9p7siQi
	0MC9DtppAnA50RMWekfOtXFy2io1gr6WiFIg
X-Google-Smtp-Source: AGHT+IFEKoh9Yoyy+qA7m2lg3d/RWinqGDyMV3KpWiUNfa6fSFU2oSwzJzlC58Z+3GwCct3Y994q9UEQVEUOAmf9XNQ=
X-Received: by 2002:a17:902:c409:b0:248:79d4:939f with SMTP id
 d9443c01a7336-2490fc97225mr123506415ad.7.1756895313392; Wed, 03 Sep 2025
 03:28:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250903095315.15057-1-yangtiezhu@loongson.cn> <20250903095315.15057-4-yangtiezhu@loongson.cn>
In-Reply-To: <20250903095315.15057-4-yangtiezhu@loongson.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 3 Sep 2025 12:28:20 +0200
X-Gm-Features: Ac12FXySq6GpPGdcsnBaBnSmKXNhwG7-Ypt-SnPNuOd4ijDkvAUU0G7fjPzdayc
Message-ID: <CANiq72n5hg-ZyGV4oEca9iCbmQByanFUpNTkS=QmE1k8MUBR8w@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] LoongArch: Handle table jump option for RUST
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	WANG Rui <wangrui@loongson.cn>, rust-for-linux@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 11:53=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> When compiling with LLVM and CONFIG_RUST is set, there exist objtool
> warnings "sibling call from callable instruction with modified stack
> frame" in rust/core.o and rust/kernel.o.

Thanks for fixing this! I have seen it for a long time in my CI:

I think this is:

    Reported-by: Miguel Ojeda <ojeda@kernel.org>
    Closes: https://lore.kernel.org/rust-for-linux/CANiq72mNeCuPkCDrG2db3w=
=3DAX+O-zYrfprisDPmRac_qh65Dmg@mail.gmail.com/

Perhaps consider adding an example of the warning in the log for
future Lore searches:

    rust/core.o: warning: objtool:
_RNvXs1_NtNtCs5QSdWC790r4_4core5ascii10ascii_charNtB5_9AsciiCharNtNtB9_3fmt=
5Debug3fmt+0x54:
sibling call from callable instruction with modified stack frame

> (1) Please install rustc 1.78.0 (without annotate-tablejump option) or
> 1.87.0 (with annotate-tablejump option), do not use the latest version
> for now, otherwise there may be build error:

Nightly is not a released version, and it is expected that it breaks
from time to time. Even beta may break. We are ~2 months away from
that release.

In any case, I don't think this information is related to this commit.

> +config RUSTC_HAS_ANNOTATE_TABLEJUMP
> +       depends on RUST
> +       def_bool $(rustc-option,-Cllvm-args=3D--loongarch-annotate-tablej=
ump)

I think this may be fine given it is `-Cllvm-args` and anyway
LoongArch doesn't use a `target.json` (which is great!), but please
double-check reading what I wrote in 46e24a545cdb ("rust:
kasan/kbuild: fix missing flags on first build") just in case.

I hope this helps!

Cheers,
Miguel
