Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2B527B505
	for <loongarch@lists.linux.dev>; Fri,  8 Aug 2025 12:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754657898; cv=none; b=INlZdsxW7S1mpL+24JMD+5JNY6xqLLH5A4AP54xZuHCF5ldzOhu3BS4pZRDTrAjIFeINfGkoH/RlYktH211Cx5j54D9tckg3PBD791AePf3GzZDgeEm54/4Q03BgaMKPGd3sUad2gMp9N9hhuEQSbCJZDHOaISUYWygS+UfF4LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754657898; c=relaxed/simple;
	bh=lVaA2mX0I2nziG8YxKTLSSrhXt/sLGPHrtAbYAygsRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8laip8S1Y0vnMZDE8NlZJgLKaz7ZpT8X4gMdL5UiA2nSezUxmW4OWlsSza9wyMIuVanuPmdODirU+Pfik5KfPylu0KynH1kQpO6i/ioskyhgdkFY3r+6k+HMsvyR62dWn1XzbmJqhCYpyBbVEuoX2C0Zn8buHCtDRC5XlJ/3dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P+6NFGPr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P+6NFGPr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CEDAC4CEED
	for <loongarch@lists.linux.dev>; Fri,  8 Aug 2025 12:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754657898;
	bh=lVaA2mX0I2nziG8YxKTLSSrhXt/sLGPHrtAbYAygsRE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P+6NFGPrq9O7OWzFRxiRxIMFBHkISaBASRSL+1gu4ZLRsY+/97P1cjKLOE4XSdiKW
	 Ekyt6vkFMIN3rWX+lrtNzE6NmgBCRu9I95TagmLyQ4DR/38z4NyIEx1cDMXYJS2j+e
	 0gUZX1mkYbO/wRcf5UF5GWD3roVOnB06L1P+a128Ws6Sr4LhtUuKXCdhzgptvEK6Ll
	 iFxvi8o40HvrJFNzq4gruW9Vd2z5B4Pzm1G1mZsMnRcWwvbAGJ8J6f3r5HPQneNi6J
	 NhPx4+gwsho8xuv+jJS9fDsHhm8F6oNHJHtpRu2Ylgrp4VQ9cABMuLk/tlEfpm0Xyf
	 9Wam/GCOCEG7Q==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so3470403a12.1
        for <loongarch@lists.linux.dev>; Fri, 08 Aug 2025 05:58:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXTjVDq9RW3Cdaxr27sNKdCse2qkQQkY3/LtSP27nDcifHt0Te0/mTLINkG9u1t376KRukGVCTQu9M=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHq+nZeUgZaCT65yeAFLGol41aBM/xmHFRXTy9XBZ0Z0aXFDRh
	dgNoWRMURtIrRChDbT5B/GEyiccRhQBcDdviwiB34lnw3kuG7TQcSkwTOsLipgYcweD0Rb2imTh
	2mJ+nfktm4uLdImUcwyu8FPu3wYpE7vs=
X-Google-Smtp-Source: AGHT+IGmNbPkKaSWcQrKq6uzVCVpLvhQgGFhqcPbV5nqrswxDDZTHLkdroXnK5MrW+qeb5tuXPE5zOV4Uf4jxoaYVCE=
X-Received: by 2002:a05:6402:520b:b0:617:d155:bc9d with SMTP id
 4fb4d7f45d1cf-617e2e55b19mr1852451a12.21.1754657896926; Fri, 08 Aug 2025
 05:58:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250805150147.25909-1-ziyao@disroot.org> <20250805150147.25909-4-ziyao@disroot.org>
 <CAAhV-H59x+KGJ8Jr4bDG7EG78aFSN=Rn7ZbkroPwHw-YPTf49Q@mail.gmail.com> <aJVt_DHt0snAHnY6@pie>
In-Reply-To: <aJVt_DHt0snAHnY6@pie>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 8 Aug 2025 20:58:03 +0800
X-Gmail-Original-Message-ID: <CAAhV-H51aM02T+kg5roB2PSSdYCC+3iZ1pCVTk3CpQ-SYPFozw@mail.gmail.com>
X-Gm-Features: Ac12FXwmrKSRoG3ecUZYcixWLd3h2iW4VX4Dqh86PYl3RKggbfX7QstuRyXVmAY
Message-ID: <CAAhV-H51aM02T+kg5roB2PSSdYCC+3iZ1pCVTk3CpQ-SYPFozw@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] clk: loongson2: Support scale clocks with an
 alternative mode
To: Yao Zi <ziyao@disroot.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 8, 2025 at 11:24=E2=80=AFAM Yao Zi <ziyao@disroot.org> wrote:
>
> On Thu, Aug 07, 2025 at 07:18:33PM +0800, Huacai Chen wrote:
> > Hi, Yao,
> >
> > Can the subject line use "clk: loongson2: Allow ..." like Patch-2 and P=
atch-4?
>
> Sorry, I don't get the point of rewording the subject... do you think
> this looks more consistent?
Yes, it seems Patch-2 and Patch-3 do similar things, but not a big deal.


Huacai

>
> I'd like to keep the original subject since scale clocks with
> alternative operation mode are a relateively large feature, while PATCH
> 2 and 4 only introduces one member or appends a new flag.
>
> To be honest, actually I don't really see a meaningful reason for
> rewording...
>
> > Huacai
>
> Best regards,
> Yao Zi
