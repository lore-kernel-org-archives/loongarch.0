Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4E72C80
	for <loongarch@lists.linux.dev>; Wed,  8 Jan 2025 01:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736300520; cv=none; b=KRQIOutwTGieDjiYiabhEMa30eTc6J0WpgXaCs9+E4zjVksTZLmv20q5eOkRfCGszW6e+Ozq+194g9+atCOSLqMquHH5KZk6nosikpCwgZ7ez2tkJVRw4nsdq+Rhrl6YYUbX5zxGTudyjG9grPWcvOOTbiqtL8iQjkejr/hTEH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736300520; c=relaxed/simple;
	bh=1OpTkAOkRYsdx+nLmJ6j2Gq9MX6VTPli1Ubl0N6KjW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u1HF7r+4qAoyb+RGKvX3TS+2vq8Cc0tP/ZK23UEIC8L/U+cnLw151ScbPXxwBPa9OuL3yeoj0n5y3hhuC/T6os2EuiUuVf5GRdGHSD58seU7nYzHqA8UA+gbPRQs94DlC6TBjZY+9iM2hd1qfDRKiOcp07jYASAOeChMP2ITLec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7wKdjY/; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7wKdjY/"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d3d14336f0so9043321a12.3
        for <loongarch@lists.linux.dev>; Tue, 07 Jan 2025 17:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736300516; x=1736905316; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtIeciZ/g1iJSCmu3k+uHr/ABbWTdxp3oCaqd/WgCmU=;
        b=Y7wKdjY/pIkXVfFb+GV9fSEST8qTS8G4USXS3WY1oj77xFvo94oGFRvMo7Benna7Kn
         /NLMCzO1i6qRr8IU+q6oSBc/FIH855pAekTqJjxSJGjHMEgWHk4TqPlnEC+xdVWQwumv
         HSTSktHdMpbliIt/ke5FVP7VWq93uGM/1HEN/8u1qbVtqLVCDnIz0YN91zyN+LP/WMNZ
         2BhtUSj3qREN56vR22pOr9qD4hPXTZ1JUy1Ro58ytfO+fcx3Ic8bcYJIIEFQ8aJmtOjP
         zolQ/3btDGI6DvM9OSEHd1AG6BCA4Oh9dG2bbNEg10pOTZq/UX3uckSp0GvL1SAUMQKq
         Ayww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736300516; x=1736905316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtIeciZ/g1iJSCmu3k+uHr/ABbWTdxp3oCaqd/WgCmU=;
        b=f3D76vTupa8wvlbIDVzTPK7gnyOGtOqYG3zXaEr0rlFtQXtlxCZ9Q/AcG96IV+IGtK
         Q2DE52diYH/yIpUYeTj1NoADZoEStAxCo+VXe02qchpw1NaHP4FXqXMyiuHUpNiTS7nM
         n6ivrSnc1wf/RV/MPZjiPWfHMfgoAB+YlIuEC6qIcJHX8/VWOR9q+LP2VBZ4qR0bRWUT
         B2oJuJVVINUuU2Onvi/Ry4FcVm0UoHqOC472nkbpidbjec/6TkouN0H8v40Wl29NxNib
         OA8rNk9ccuxkId6HuyxVSaB5okj2Gz4mV06d7XcAX4eifiZ7UPMtqffkQs6qDKYfeXC2
         o60w==
X-Forwarded-Encrypted: i=1; AJvYcCWa61wXMYwo/FYzAyc/SFAmRGdCR/nK6ZcwGudNd2EXfjJ4nVrrPBMQeqU0WG6o+oDMhHsUHx6+t0g=@lists.linux.dev
X-Gm-Message-State: AOJu0YyONVz55cBQ5ImXxNiVTtf0eTPy+0R+cAr/ubDRO3RP5n8GqsfW
	BlD7UkO0qNU7jCAbOoVAXzN72hKCwUePJy65Fo6kIXM/W7MJ/Jdj8lKsiInQwyQV9A49R3YcQzp
	5E2kFSdphit+BsiVbtpFJd3lHkseUgaXN
X-Gm-Gg: ASbGncuwwVPAjFImlvT/pIM9OWVSCtgPeoiX5PfHKHdtEXBsARsKgPObg6U2YnxYeCl
	jW8dt7KtHL0F3z6CHfCB9tQiVBBdxclcST8QVmRWq
X-Google-Smtp-Source: AGHT+IEXnftuts1x526l0SGl0TATOqcH25L9RRGplwVNSFmdu0lanacpZyXiDSJEvFIwUT2xqLUCMNMQL0z0fKBwzbA=
X-Received: by 2002:a05:6402:5255:b0:5d9:b8b:e347 with SMTP id
 4fb4d7f45d1cf-5d972e722e6mr767433a12.32.1736300515342; Tue, 07 Jan 2025
 17:41:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241225060600.3094154-1-zhoubinbin@loongson.cn> <526d7ad1f0b299145ab676900f81ba1a.sboyd@kernel.org>
In-Reply-To: <526d7ad1f0b299145ab676900f81ba1a.sboyd@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 8 Jan 2025 09:41:43 +0800
X-Gm-Features: AbW1kvbB4pWoEyqoFJ8m-ieCyzuHVNQ6r5mSvClgvDTKpIFxRzU6O4GgjR77pm8
Message-ID: <CAMpQs4+i11DVGhdinMrE41HkC8hhD11P0BLeOaK5yW8QXUMX-Q@mail.gmail.com>
Subject: Re: [PATCH] clk: clk-loongson2: Fix the number count of clk provider
To: Stephen Boyd <sboyd@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Michael Turquette <mturquette@baylibre.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, linux-clk@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen:

Thanks for your review.

On Wed, Jan 8, 2025 at 5:25=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wrot=
e:
>
> Quoting Binbin Zhou (2024-12-24 22:05:59)
> > Since commit 02fb4f008433 ("clk: clk-loongson2: Fix potential buffer
> > overflow in flexible-array member access"), the clk provider register i=
s
> > failed.
> >
> > The count of `clks_num` is shown below:
> >
> >         for (p =3D data; p->name; p++)
> >                 clks_num++;
> >
> > In fact, `clks_num` represents the number of SoC clocks and should be
> > expressed as the maximum value of the clock binding id in use (p->id + =
1).
> >
> > Now we fix it to avoid the following error when trying to register a cl=
k
> > provider:
> >
> > [ 13.409595] of_clk_hw_onecell_get: invalid index 17
> >
> > Fixes: 02fb4f008433 ("clk: clk-loongson2: Fix potential buffer overflow=
 in flexible-array member access")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
>
> It's common practice to Cc the author of a patch in Fixes. Please do it
> next time.

Oh, sorry it's my fault, I will do it next time.
>
> >  drivers/clk/clk-loongson2.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
> > index 6bf51d5a49a1..b1b2038acd0b 100644
> > --- a/drivers/clk/clk-loongson2.c
> > +++ b/drivers/clk/clk-loongson2.c
> > @@ -294,7 +294,7 @@ static int loongson2_clk_probe(struct platform_devi=
ce *pdev)
> >                 return -EINVAL;
> >
> >         for (p =3D data; p->name; p++)
> > -               clks_num++;
> > +               clks_num =3D max(clks_num, p->id + 1);
>
> NULL is a valid clk. Either fill the onecell data with -ENOENT error
> pointers, or stop using it and implement a custom version of
> of_clk_hw_onecell_get() that doesn't allow invalid clks to be requested
> from this provider.

Emm...
Just in case, how about setting all items to ERR_PTR(-ENOENT) before
assigning them.
This is shown below:

               while (--clk_num >=3D 0)
                         clp->clk_data.hws[clk_num] =3D ERR_PTR(-ENOENT);
>
> >
> >         clp =3D devm_kzalloc(dev, struct_size(clp, clk_data.hws, clks_n=
um),
> >                            GFP_KERNEL);



--=20
Thanks.
Binbin
