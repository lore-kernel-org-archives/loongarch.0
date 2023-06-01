Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E486539B
	for <loongarch@lists.linux.dev>; Thu,  1 Jun 2023 07:42:28 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-75afeacb5e4so56397285a.3
        for <loongarch@lists.linux.dev>; Thu, 01 Jun 2023 00:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685605347; x=1688197347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wC4AZRVcHnRKNLMlbDCAYeJz9LlsudAe96MnAggdWqk=;
        b=EUCMCam46zWlk9JqtS0VIm6eS8hLmS/7LzhgZz50h8Xr/VynFC0UEMTIrM8EHoYXQe
         7YVGlRq6KV9zsRWW8ortxyShAdfjrMaqhRVdBoQyO68lzSGjiiqZnK01/GYm54jh+4eX
         P4Vm+Ohg+QGjfemgS8RbOWS1V6URQdWSr0RRzHXh/XjcTYkmw8E+6WOCcx/zbVQtJlNt
         jvZgHbrp1w+wfWr83zbkOp0MPJERBg1wjk/Wuy7ePMkod0zZnVUPOY6lyKuxByO5MhGz
         H6rRO96+OJgbztXoUpa0rF9uMWLy4nPyjB5pAPacvQb23znGhfKRhtDcdAZF88S7ajhS
         dHgg==
X-Gm-Message-State: AC+VfDwe6vwvKQeuRc+LOcKEisU5dhLXJ+QTM3ExDHgLGu25aF4p1lNe
	1nKh1A8LGGGXQ85YW8J8xAIfxyyUZQmOOw==
X-Google-Smtp-Source: ACHHUZ5eQPfJwvDj8Fq1aeSRNSCdSbwclejEVkt2tK1AbzGDIqHN09SJA4wKbN/+6uyU0RNCrHQ6fA==
X-Received: by 2002:a05:620a:a52:b0:75b:23a1:3610 with SMTP id j18-20020a05620a0a5200b0075b23a13610mr7930821qka.33.1685605346886;
        Thu, 01 Jun 2023 00:42:26 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id x3-20020ae9e903000000b0075b23e55640sm890094qkf.123.2023.06.01.00.42.25
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 00:42:25 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-75affe977abso58356685a.0
        for <loongarch@lists.linux.dev>; Thu, 01 Jun 2023 00:42:25 -0700 (PDT)
X-Received: by 2002:a05:620a:4890:b0:75b:23a1:3603 with SMTP id
 ea16-20020a05620a489000b0075b23a13603mr8693674qkb.20.1685605345152; Thu, 01
 Jun 2023 00:42:25 -0700 (PDT)
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
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Jun 2023 09:42:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVx_0Dhz1fOsCr3aYAVpk1HypoPJwbdNDj3h08x4esu0g@mail.gmail.com>
Message-ID: <CAMuHMdVx_0Dhz1fOsCr3aYAVpk1HypoPJwbdNDj3h08x4esu0g@mail.gmail.com>
Subject: Re: [PATCH v3 30/34] sh: Convert pte_free_tlb() to use ptdescs
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
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

Hi Adrian,

On Thu, Jun 1, 2023 at 9:28=E2=80=AFAM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
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

I think so, so your Acked-by would be appreciated...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
