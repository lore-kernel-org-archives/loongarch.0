Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF887C
	for <loongarch@lists.linux.dev>; Mon,  2 Jan 2023 08:31:03 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id m12so12831868qvq.13
        for <loongarch@lists.linux.dev>; Mon, 02 Jan 2023 00:31:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jo2CI5pKv7C2jtNLeQsFhlozXL/lFYNzin08UvE0x2c=;
        b=UyiNckwQCb3AGTQ9PYu1Fazi8JS7ZWN3uwyNzdYsO3VK5nsSJIMLi1zHh4dJlZDmPO
         /m8o90q+2ScSy+UsX38qhSJyO4oR6gZHH+K+XXQBBa01ppa3YqqrNX05zYQLAEwoN7fl
         7MwKzJdxn2SVM4neU+Jj47/iNW2RqvIjlVnt/YW1m385wOxjA9e843p4jJ+t4Bs/mdwr
         HGjyYvcJMteeavXjEGGQil40lJW/LtrOLTv920QanMjMTqcanao19amkZGb+sLkqh9z3
         us1KBLyyLuFuU+PU64a2cGx6ZgBTkpt97bqg9GMYVbTEg1a6R/dATJk8eaAZcXiO7ZZq
         DTsA==
X-Gm-Message-State: AFqh2krfRis6FOAz3CMdsZA+p5PIyPppWOwoeaJCCQd+mACh3r0wUTnv
	GEJfJKU/47nzaVfQnCY3p4VQT+c0F4y1kg==
X-Google-Smtp-Source: AMrXdXtDhfD5al99J+TG1P9ixD9thhMOk5+7FQQJzg8W7McuT6yqHUxJOymPxShQiX5Uo/6PVTXQcA==
X-Received: by 2002:ad4:52e5:0:b0:4c7:797e:7788 with SMTP id p5-20020ad452e5000000b004c7797e7788mr52829071qvu.20.1672648261966;
        Mon, 02 Jan 2023 00:31:01 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id bj42-20020a05620a192a00b006bb82221013sm20392775qkb.0.2023.01.02.00.31.00
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 00:31:01 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id 83so28730418yba.11
        for <loongarch@lists.linux.dev>; Mon, 02 Jan 2023 00:31:00 -0800 (PST)
X-Received: by 2002:a25:d243:0:b0:702:90b4:2e24 with SMTP id
 j64-20020a25d243000000b0070290b42e24mr2730771ybg.365.1672648260480; Mon, 02
 Jan 2023 00:31:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <78b23407-bdd0-4b1b-bf6e-ecd4c00294ab@app.fastmail.com> <20221229113338.2436892-1-andrzej.hajda@intel.com>
In-Reply-To: <20221229113338.2436892-1-andrzej.hajda@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Jan 2023 09:30:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVaq9Xg3HrqLo1x5SCuwtJBsczLjWAWmH=23ZtNf_e9hQ@mail.gmail.com>
Message-ID: <CAMuHMdVaq9Xg3HrqLo1x5SCuwtJBsczLjWAWmH=23ZtNf_e9hQ@mail.gmail.com>
Subject: Re: [PATCH v2] arch: rename all internal names __xchg to __arch_xchg
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-xtensa@linux-xtensa.org, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Mark Rutland <mark.rutland@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 29, 2022 at 12:34 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> __xchg will be used for non-atomic xchg macro.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> [m68k]

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
