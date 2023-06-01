Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B845392
	for <loongarch@lists.linux.dev>; Thu,  1 Jun 2023 08:22:14 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5659d85876dso5067327b3.2
        for <loongarch@lists.linux.dev>; Thu, 01 Jun 2023 01:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685607734; x=1688199734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3q8fSv1CYQ8OeBSkoHHq8yQzPVMEdcVj1sJJBohCe0=;
        b=scnpKoycafdSA6Zmoxe64NtU1IPtpP1XoN7u6BxbHgaNpHHpBaRgfB2X/NbVQI3XUI
         S43vtnrb0VpUQFKtCtNAL2Z4eQGxKB9jkDmQzBef6OSmzPFkANcNw2nEHbBaxtIGRJFx
         F2gdbWX0/JO50BjGXzMMRjG/dVaN6/37Aaxe3j2XyiD9NBGl22snChdmfv7CpIBT4YsT
         wzEsBAOaAGJLasaxdabRza57BmBoAT7cVmGOq5aUEFhtYj/c1WejBdPyTkL2OU+y9vxz
         zNiBma0es8vOX0CahjWds9KH8J6DH6xHzp6sGGczNoDJQcyp7Q2snP8wt+QQc7Qs4GOa
         fyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685607734; x=1688199734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3q8fSv1CYQ8OeBSkoHHq8yQzPVMEdcVj1sJJBohCe0=;
        b=TYqz0qTelFk3OAWHriFayGLBFDBLV7RVc84JG7KncPoHpWk5ZmTA7AExE6TMdQFJw/
         8aXh82/DPl0L6bcbUdlypG39o5ZglDk0H/dM+4BcJY96Huj9ZzgL/ROS8VA2YAfexBrU
         l5xV42U3eWbEXhkqwg/ZOMwE84G663Ek1tiRoCaZgwu4xTzZXhvZpAvLP52icNKJZaj2
         3p2oFm/ptF9ccdNoZh1aCN0fLauOfGdwbESdjA49VaGH8AFk3YgvljW8Ad5VufgAqn6t
         z3tuTGfWh7VEiz3I0ZR/S2BbA2gIIU9AfF5PLxQBVv9YmAbdPZBT5xPhRGFBUxIIA5ww
         2SzQ==
X-Gm-Message-State: AC+VfDwOWUJMHetPSncupRVKv/rl1rzSc+nNh6iv3k/g6LM8HJ2X5CaY
	ogIbrsSYv/meVr2BbAhjYz2eSbOdOwyZHBcTBzc=
X-Google-Smtp-Source: ACHHUZ4BVGpqKx729yAA7sIpRRuJCk9B2q39qd4V84f+TNhLT6e1WTgI1mcqI+pCtHVuJpHfepvjflFti312UIm7bGk=
X-Received: by 2002:a0d:f5c2:0:b0:568:d63e:dd2c with SMTP id
 e185-20020a0df5c2000000b00568d63edd2cmr6202683ywf.11.1685607733835; Thu, 01
 Jun 2023 01:22:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230531213032.25338-1-vishal.moola@gmail.com>
 <20230531213032.25338-31-vishal.moola@gmail.com> <CAMuHMdU4t4ac_eCH0UaX9F+GQ5-9kYjB_=e+pSfTkxG=3b8DsA@mail.gmail.com>
 <025fc34a24e1a1c26b187f15dba86d382d9617eb.camel@physik.fu-berlin.de>
In-Reply-To: <025fc34a24e1a1c26b187f15dba86d382d9617eb.camel@physik.fu-berlin.de>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 1 Jun 2023 01:22:03 -0700
Message-ID: <CAOzc2pxnb6WXoVK5JXX42R0Q6FK59Q1uebQskK2fxLn6DuicqA@mail.gmail.com>
Subject: Re: [PATCH v3 30/34] sh: Convert pte_free_tlb() to use ptdescs
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 1, 2023 at 12:28=E2=80=AFAM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi Geert!
>
> On Thu, 2023-06-01 at 09:20 +0200, Geert Uytterhoeven wrote:
> > On Wed, May 31, 2023 at 11:33=E2=80=AFPM Vishal Moola (Oracle)
> > <vishal.moola@gmail.com> wrote:
> > > Part of the conversions to replace pgtable constructor/destructors wi=
th
> > > ptdesc equivalents. Also cleans up some spacing issues.
> > >
> > > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> >
> > LGTM, so
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I assume this series is supposed to go through some mm tree?

Hi Adrian,
I was going to have Andrew take this through mm-unstable
once it gets enough review.
