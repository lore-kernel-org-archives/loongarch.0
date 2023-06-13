Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D15F17D0
	for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 07:29:11 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-56d304ef801so19437827b3.0
        for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 00:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686641350; x=1689233350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKEzJjzBKla4S0x8jxwIAxVSx314J/aF9PC4BBXNBUc=;
        b=PX9xjNZqThoxDUNwR0JOZjlth6rfOs2scVpJVhowiMWDy69HBzlLm2sgzhQL+L5nvq
         DHykSgn3H2/tH/YGeAxYdM8bvgb/OGB9GoBpqFiYcyrN5hkXjmKM7QosESc0gObMAQiD
         NMyNVSjYjXKiL75XeTytJWyCX91/FW3gnW4n3FgBLxBULJNu/tfmspDFPuwRI5/jN19R
         YkhNpakLwE8nNyzOGUEYqnT91Up2ZTXmpCUTBxkV1ct9YpGElvX4LV75RA2PjBzppbQE
         izLg4As+1ZeHh27Cs52xZObaxFvwAYyTfpwFZgaQtT9GfY7pFa9I7ku67MeW5yh6NsyL
         iA4w==
X-Gm-Message-State: AC+VfDwMG04253jekNjQ0207zkPOQ4DW+pS8jAkbhbf/ogwOUU8wT2Bm
	PvOQmLY8n3AX6tk+HCv+fTsd5Be9qXcmlA==
X-Google-Smtp-Source: ACHHUZ7e5l983hQ9z6VUrQ4zbbk7ilJmNuShvuOqy9FIO8XrvBjYLQ2Z4sqd4jVjSDm6bqtIKdQGqw==
X-Received: by 2002:a81:9145:0:b0:55a:12ab:a739 with SMTP id i66-20020a819145000000b0055a12aba739mr1056761ywg.47.1686641349990;
        Tue, 13 Jun 2023 00:29:09 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id m3-20020a817103000000b0056fe7d64111sm103818ywc.125.2023.06.13.00.29.08
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 00:29:08 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-56cf913434cso35945067b3.3
        for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 00:29:08 -0700 (PDT)
X-Received: by 2002:a0d:d611:0:b0:56d:ddc:cdbb with SMTP id
 y17-20020a0dd611000000b0056d0ddccdbbmr1077781ywd.25.1686641348561; Tue, 13
 Jun 2023 00:29:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230612210423.18611-1-vishal.moola@gmail.com> <20230612210423.18611-26-vishal.moola@gmail.com>
In-Reply-To: <20230612210423.18611-26-vishal.moola@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jun 2023 09:28:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUk2OM+j_j8XSkMxRnNqmKy3qwUA8Mq-RA+p+ByfY-+4g@mail.gmail.com>
Message-ID: <CAMuHMdUk2OM+j_j8XSkMxRnNqmKy3qwUA8Mq-RA+p+ByfY-+4g@mail.gmail.com>
Subject: Re: [PATCH v4 25/34] m68k: Convert various functions to use ptdescs
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
	Hugh Dickins <hughd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 11:05=E2=80=AFPM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
> As part of the conversions to replace pgtable constructor/destructors wit=
h
> ptdesc equivalents, convert various page table functions to use ptdescs.
>
> Some of the functions use the *get*page*() helper functions. Convert
> these to use pagetable_alloc() and ptdesc_address() instead to help
> standardize page tables further.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
