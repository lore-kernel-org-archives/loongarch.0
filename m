Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10C41D6792
	for <loongarch@lists.linux.dev>; Tue,  3 Sep 2024 19:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725390084; cv=none; b=cooyTbtaUxciuzULuKQsqu7F3+yxnT6T8V5zEetv3qUvrRpI79zuFrXjo79L/Mz9EYzS5e2jX5wPTTRLEJSGMYV6TnP1AFxqvmtBKmMAYLYaTZ3xW9GSj9DnNiw8HTphoHP7bBas3uc0XHPB5NTBjDlqo7NukBwimq8Unm/0Few=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725390084; c=relaxed/simple;
	bh=UvKaRrOw7SizEU+Eg3t01fFMiofBkP5X9mkQBRTB/EE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bvRBszzW/6HsgAh9yYa7Nt/ISLTmg/YDEOjmnG2N22PdtDmQ/cqaCx3aCk3tGv6Ib44YcxqUp8bdCtew4aRNIvpDrPZSFliMTIPE7ctQb7nABiWd27zgBOHy+Dy6Ad+mLxkh6OC1lQIeVRxr9dA+6gVU6Iw8JCY/PMdA/bS5YwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhzvEHCy; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhzvEHCy"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f50966c478so60623191fa.1
        for <loongarch@lists.linux.dev>; Tue, 03 Sep 2024 12:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725390081; x=1725994881; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luh7BfYLwX/7YYvz9h2M0t/wGSBnpzt8TNRH/XIw5PA=;
        b=FhzvEHCyC8y+V6a2tIxNJIpYcZx8c7YAlSv2StObxrW71t5HH150bpa3M1mL4kvkH/
         4OiqCGnpbWtaJTFPYTTYlm3dsi0M+xm4HVyxs4U1MfmUtwVxGYOh5fbGTWaPqpTrjBGi
         wP6FSPOxOr5DNZM7MQC+/CKdDrks9Hi5aNbUib01wzFa4XGJX7aKdFjnhSb3+3C7YXPN
         gEFEbBZFVe3uc8XId/G004D/hD6i9L7ojiXMX+jkIgevDCnblC/fXHwn+np0Kwt3Bd0E
         c+PuZk8leGfbi7MefwE0dQuBx/w5cCOiy+50t2RckopNGDn+FHmoAv/aji12ov6XsVxo
         bI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725390081; x=1725994881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luh7BfYLwX/7YYvz9h2M0t/wGSBnpzt8TNRH/XIw5PA=;
        b=fBm08o79wKAb1XaDVQ0VuzSLmW/a3743+tui2Po+gvLl1AOvG1BZuH1PPcoqrm3H8Z
         8MSRB9B4x0Cl7lhaKQ/bZ2g/VPPftISfTqYXlPVxCB72rDrH8Jhu8FuyBgV4EcH0TdER
         6q7ZBm/riTC9pkIID4unHxZVxrwRON3FbT7/6PeTBWmGEarE27ZWJXCpnXq/WLZ2H2tN
         PjSxrQljBF/J19r6uWMeMQEaQPLSjPhzLkLZp5nnvX6CtTLW/rqxKyYDF/75xvQ8AE40
         XJOmH7zouJehH5ngYL/w66UUX37R7gArwolAUs1Y/kBNUMdGaPWmtoVF+eHQEw9UuevB
         qR+A==
X-Gm-Message-State: AOJu0Yzdy2/zCx0pNTmQzyQSiOkKC4vt8zmsGZYYNOQbRJJAPCIb/pA3
	wyQTAKWwRG4PjhHaqoJKb5QKWNDkPIXmKYAPq+w7ODncRlZS4gEYWSnZgGP8jRDArmfjhDGqBou
	BmzRsqQXUe8yFSNwodSGH6lFVPw8=
X-Google-Smtp-Source: AGHT+IFNPZESYuAGmVCQP5ePJ9Xq8JiFFCbwpggP3rkZ0vrJ4cVFwPxC/xT0SxglEUhnoCT9NtCA0Bn4vkbwyIqm5tU=
X-Received: by 2002:a05:651c:1545:b0:2f1:6821:d15c with SMTP id
 38308e7fff4ca-2f61e0b268bmr89081621fa.38.1725390080108; Tue, 03 Sep 2024
 12:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240903102342.36957-1-ubizjak@gmail.com> <e01dcb5fc34b4686c7fb32d1644802c164910ecb.camel@xry111.site>
In-Reply-To: <e01dcb5fc34b4686c7fb32d1644802c164910ecb.camel@xry111.site>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Tue, 3 Sep 2024 21:01:12 +0200
Message-ID: <CAFULd4b_vemxT_6dWRWmjwZKyVSKyojY0Sw77hppsC+--qbZZQ@mail.gmail.com>
Subject: Re: [PATCH] longsoon/percpu: Simplify _percpu_read() and _percpu_write()
To: Xi Ruoyao <xry111@xry111.site>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 8:57=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrote=
:
>
> On Tue, 2024-09-03 at 12:23 +0200, Uros Bizjak wrote:
> > +#define _percpu_write(size, _pcp, _val)                               =
       \
> > +do {                                                                 \
> > +     unsigned long __pcp_val =3D __pcpu_cast_##size(_val);            =
 \
> > +                                                                     \
> > +     __asm__ __volatile__ (__pcpu_op_##size("stx") "%[val] $r21, %[ptr=
]      \n" \
>
> Missing a comma before $r21 (as the bot already pointed out).

Oh, indeed... I triple checked the patch and missed the most obvious thing =
:(

BR,
Uros.

>
> > +             :                                                       \
> > +             : [val] "r"(__pcp_val), [ptr] "r"(&(_pcp))              \
> > +             : "memory");                                            \
> > +} while (0)
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
