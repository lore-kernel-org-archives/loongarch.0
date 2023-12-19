Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C553E14A87
	for <loongarch@lists.linux.dev>; Tue, 19 Dec 2023 10:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFU0bS0H"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dbd4608121fso1285258276.0
        for <loongarch@lists.linux.dev>; Tue, 19 Dec 2023 02:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702980298; x=1703585098; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtmePwAcnzygp3Qmz7bxCILAS5QH9CerThq3NksI2Vo=;
        b=CFU0bS0HToB/Wt2QxN9qsY4Y4G8vqgvB10sURB8+/DgCgjlMHn/Voe23fAXR63v6Me
         OGZ1YkbHs3zpmiaZyix+j/4TGYSGJhyi/GhNGzYfUPEjDoz3hr4QfxEVAeaMd63yxSBW
         nKxQxJIyzQ1XPWb64EMHW+QVEozQD9w5kuDhVGFAg0XHmb9X48CMrXPN9iir5DEqplQP
         LftAwQNg8hW0flE0EFpoWnwO66Z95bZXbBadYp5/pEpcIP4G3Mmx+FQlCR1F8In0ETFm
         09a7xjiJQEcXsbqJriE4B9JLaT0rZQU1IAye4VbzY1LRbMdogNTBIgjCT3U4tTuTmw1D
         oshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702980298; x=1703585098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtmePwAcnzygp3Qmz7bxCILAS5QH9CerThq3NksI2Vo=;
        b=LW+LgISS3IcEtanQ9GUENZUVLbLZafjLOSfrE9W4LO2LryHA9EKOBPGEtwTMrZFyvz
         qtvcHeIFufvRAgpmunVxELMh78y/BW99CqXp9JVfM3VVFZgL2kxZcKBGrlHR9rjq3PDD
         3YwqIufDEzj0/EX8mc2iMi0TmqcVl0+2D3J5TkQblbTxeicuHEjo6tBcoCSdoZu//g9A
         cNR+pFIF3Qk0KHzZM/rREcZ392h4+mwqY5wrqnnAF1ihgjk0IqTWCLh4a39sMWfL9qw3
         8eei2Fq7FQ6aMPP1UXEvHCbEe7sZeBwSfQ2afXlkJzgte9X4h8oh/ZyXW/IdF41btlvF
         pSKA==
X-Gm-Message-State: AOJu0YwoImhSbTfuX2FhKAlEp158PxTuCFXUzVePEXW2jx3TrAA1KGZg
	leYmSeV9O+/rY02y2Vf2KqO0LHhPtJijskRIMvI=
X-Google-Smtp-Source: AGHT+IFwb2ec+zfr6Wfw/Fdkw9zjx4Jzpv7RCdgcJx+nY0F9EihKgtIYNF8ulPoYjUAKnRFVPlwImVX0EEo0veHmIng=
X-Received: by 2002:a05:6902:98e:b0:dbd:4caa:ef09 with SMTP id
 bv14-20020a056902098e00b00dbd4caaef09mr1061525ybb.9.1702980298645; Tue, 19
 Dec 2023 02:04:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231219091405.39867-1-wangyao@lemote.com> <CAMj1kXEPdMBkne=ugR_j1Be8Aeh8jCA_ryHvh8rMA-c27i+RuA@mail.gmail.com>
 <CAPWE4_wydoTWHUYPmALp1oii+=ALVy_BTDUO_1wOo7XmkJ=cjA@mail.gmail.com>
 <CAMj1kXEL2nuVyNq1O=ytrCr3xh3tA6TU6kRFuk07H1EmneRTTg@mail.gmail.com>
 <CAMj1kXFqpJvH0ukOTufsLCTyCk1abct1kaPUV3JTaS6hMb75Og@mail.gmail.com> <CAMj1kXFFb3ksR=HCxiWpfhcjRcx-U=XE5LmZ2AMt9K110QpynQ@mail.gmail.com>
In-Reply-To: <CAMj1kXFFb3ksR=HCxiWpfhcjRcx-U=XE5LmZ2AMt9K110QpynQ@mail.gmail.com>
From: Ainux Wang <ainux.wang@gmail.com>
Date: Tue, 19 Dec 2023 18:03:59 +0800
Message-ID: <CAPWE4_wAa5uYEqkSRkJH+V57jNgjUZgFcrrjtRqRDECTCCASyQ@mail.gmail.com>
Subject: Re: [PATCH v2] efi/loongarch: Directly position the loaded image file
To: Ard Biesheuvel <ardb@kernel.org>
Cc: wangyao@lemote.com, chenhuacai@kernel.org, wangrui@loongson.cn, 
	linux-efi@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ard Biesheuvel <ardb@kernel.org> =E4=BA=8E2023=E5=B9=B412=E6=9C=8819=E6=97=
=A5=E5=91=A8=E4=BA=8C 17:35=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, 19 Dec 2023 at 10:32, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> ...
> > I'll queue this up.
> >
>
> This patch does not apply. What commit is it based on?
>

It based on the newest loongarch-next branch that based on the v6.7-rc6.

Link:
https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.g=
it/log/?h=3Dloongarch-next

> ---8<---
> Applying: efi/loongarch: Directly position the loaded image file
> error: patch failed: arch/loongarch/include/asm/efi.h:32
> error: arch/loongarch/include/asm/efi.h: patch does not apply
> error: patch failed: drivers/firmware/efi/libstub/loongarch-stub.c:35
> error: drivers/firmware/efi/libstub/loongarch-stub.c: patch does not appl=
y
> error: patch failed: drivers/firmware/efi/libstub/loongarch.c:37
> error: drivers/firmware/efi/libstub/loongarch.c: patch does not apply
> Patch failed at 0001 efi/loongarch: Directly position the loaded image fi=
le
