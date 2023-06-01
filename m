Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF41539B
	for <loongarch@lists.linux.dev>; Thu,  1 Jun 2023 07:20:21 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-75b01b0c712so61468785a.3
        for <loongarch@lists.linux.dev>; Thu, 01 Jun 2023 00:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685604020; x=1688196020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uahBQ1+NZ4LtBmJlKuzSeHMKUQpvPqnHtI00z7d7Eg4=;
        b=ickS08rORIU8juWy3ztNj71mk2R1N81vEYv+mg9x6XBHPBNc+MHS9j6cDAU1fj/hu4
         pppi/dPhkxR+pV+1mJFlWprWA2ZNAh7drFtznietScn79++g4SXNxai1iatPqceyo2Br
         CUahEaIFkNOttk/4MzzWZVUVMRGlWQZMqi3IHeJGNjUO7rSV1MRER3R5553H7pBnc3uU
         CpF5QJav2/MZ57xNDQ64NidF3pT5RAjTP3DsJNRcGVXVAsT/AWkj13h9av6LRi+SxdQq
         PHHM+w78G3v7D1pKZ86BDKavXPakrF4V37EOGroB3JOHO0YqvNij73RYlL0U4drO6sI4
         D/IA==
X-Gm-Message-State: AC+VfDw9tb6ZFMYs8QXvix6FCMJxu7C6bfuIGUiZhYJiG0nUQpdnZ5eu
	bDUkPaMBAIx7ExMy+n3qmzwAnCIb6zpgMw==
X-Google-Smtp-Source: ACHHUZ6iihjph1n1pnkmR/GkuTMWgqEAFqHmA6iVnFh4cu8sf6R/TddGYQ0O4MdKZ0NtdUZx8rYzaw==
X-Received: by 2002:a05:620a:22f7:b0:75b:23a0:de98 with SMTP id p23-20020a05620a22f700b0075b23a0de98mr7860222qki.22.1685604020011;
        Thu, 01 Jun 2023 00:20:20 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id n63-20020a0de442000000b00545b02d4af5sm5381467ywe.48.2023.06.01.00.20.18
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 00:20:18 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-bad97da58adso549350276.1
        for <loongarch@lists.linux.dev>; Thu, 01 Jun 2023 00:20:18 -0700 (PDT)
X-Received: by 2002:a25:6891:0:b0:ba8:7122:2917 with SMTP id
 d139-20020a256891000000b00ba871222917mr10052062ybc.0.1685604018484; Thu, 01
 Jun 2023 00:20:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230531213032.25338-1-vishal.moola@gmail.com> <20230531213032.25338-31-vishal.moola@gmail.com>
In-Reply-To: <20230531213032.25338-31-vishal.moola@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Jun 2023 09:20:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU4t4ac_eCH0UaX9F+GQ5-9kYjB_=e+pSfTkxG=3b8DsA@mail.gmail.com>
Message-ID: <CAMuHMdU4t4ac_eCH0UaX9F+GQ5-9kYjB_=e+pSfTkxG=3b8DsA@mail.gmail.com>
Subject: Re: [PATCH v3 30/34] sh: Convert pte_free_tlb() to use ptdescs
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 31, 2023 at 11:33=E2=80=AFPM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
> Part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents. Also cleans up some spacing issues.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
