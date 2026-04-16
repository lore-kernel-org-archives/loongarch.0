Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2CF39D6C5
	for <loongarch@lists.linux.dev>; Thu, 16 Apr 2026 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776335502; cv=none; b=m6ppcPSunP+zZ4pDdEe9dpV95NiF+sPYGE5O8DVcY6vWcloSkPoF2APOYJsguqUXJnDeGKi6+ej486clptsmIhaQOzPqWYiBGGKtaw6GkTdg5TXMwnjMSI+FVI1ZtufQY721tXw/uJupsaayXcTdEU4uDjUgVnQtRVv8FS88e7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776335502; c=relaxed/simple;
	bh=Il5EilNKbQmVM1qv4XgxLAe02Z9+zxydkwUqJc2BPRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mpxhiUlyB26OjgZ2m1EsxFYl+fx7GsPrV7hOdH1tgnMES7Ho6JsATrwirz57tQ3fy9pBN7ieoBaJzc3uyY7MUVR1nmOLzN9jWksOzDXcoUuc6wjGAf4XSY/1yiQ4qbY6Xg9flA67vjTe6FOU6BRhIbEGCZHG+AAjugPzndGhWVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-409de4132b5so4996771fac.1
        for <loongarch@lists.linux.dev>; Thu, 16 Apr 2026 03:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776335500; x=1776940300;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9HEDsaws+1AaPEcUyrGjtCss1Kv3jZQFAB8Oib7mmY=;
        b=YhtyaaZj/t5QaGEI3o7U9uZxILnn85S4IK7MADdIo9lm/4ViXRzt0N7nvYgX3G+ha8
         8sCuGeCakBizAH0hUTLIxAwS3AUl+wItXmNCLCR2PZLDW6g6yE5BDpAgo6lh83XBPxp4
         X2pOp53vSdM5yMcGl0MaVJ8S0HT4nZJAd4prtP6B9tg1rbIFw2jw8So0rVF+KWLEX7zs
         ACPvp0i5M9mdoSX0d5I6l4/TBNwcFuyLiz1aypyyeJdYjcMNpVzeqn8kEVsxC8FSOv6F
         pBRpNJH9bH6FgiWsPFxuVZgDHGdIOj2nid9abmWvilk9EzuO07Zcu4DAiBkyJG17vIyX
         grwA==
X-Forwarded-Encrypted: i=1; AFNElJ+ncEl6K/IvihCvLvKf3j+Ko6P5Yu/RZObo2EvP7ocSgUqZiG8C2oWmTnVMWqHkBi4H10Vqe8fFNd4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgsWnqqI4orVv6si3yVTV9uzzumCOY5Nm+0THsS6JB7NAa1qrv
	EOL93NV4lWbncDAoReivcSf3NXlMj85I3Nu5PGkXVBexdl9aQxoMJwGbED2Ihj3X
X-Gm-Gg: AeBDieuuDYhjnOPG5GyurBNBq0VAmWL5FgxSmSkMglg1IrLLVKBNQBdsrEopMjaR/0d
	AeW0MxwLcoSVDZd+G892aOQs6QPUXydmsBTuOopqBMzKQLBCYhtDb0xLw8pOoOtqVGMY70UM9CU
	kB9yZCyYWl6SN/+s1l5xHSciUnX7oBfh1fpkOIRdG6DzBEXYyxHZpp+rLGhL6FZlAGcX5av+Lkw
	qZ5+rJX9t/XNfyaByKJ/Eu2Rf+6UCqpxVlpzkoxBe9jwhX9htK8b7dWC5n9lflK54tTd6PqI3ci
	6JFtRvQKqpPVdn989gIOvDOsHmrEICjRSZucNvh2xAe/49S1DLOZKfMygNxkHqa4A76erk9epjJ
	xZqdFBpnVcgpBn+PPq0Vo/zGvF1I3WxakgsSsflSNUISPDjZ02tHPsSmBp1bz9lAFGL3OrJZyWI
	v3vJdrtit97rr3FbQlcecDK9zj7xHstaMotF+Pb1bu5StwJ3FbSJvvthSZQzCMW4js7ULDMZmCp
	lQ=
X-Received: by 2002:a05:6820:16a5:b0:682:7662:ccfa with SMTP id 006d021491bc7-691bfecef49mr5728214eaf.49.1776335499890;
        Thu, 16 Apr 2026 03:31:39 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6932ec80613sm2336147eaf.15.2026.04.16.03.31.39
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 03:31:39 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-470145d7df5so4649549b6e.0
        for <loongarch@lists.linux.dev>; Thu, 16 Apr 2026 03:31:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Rv7QbiflEI6N4juMnURTo8vrdjq3M+PYfs6qKUjugS9XItSFqbLOziNFne+75CNClN8NBQ4P4We4=@lists.linux.dev
X-Received: by 2002:a05:6102:c48:b0:608:cd24:354c with SMTP id
 ada2fe7eead31-609fe9b0d22mr11966750137.3.1776335071251; Thu, 16 Apr 2026
 03:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120318.794680738@kernel.org>
In-Reply-To: <20260410120318.794680738@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 12:24:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVerN6Pz07CQH+hcvT=-ZD-r9VNrSrGzTQZBEsuecK_ig@mail.gmail.com>
X-Gm-Features: AQROBzDRGGELVSySTko37h6zEj8YoV3p6pwZDCVQUlUW6sZbw_W5mbJzFIh35nQ
Message-ID: <CAMuHMdVerN6Pz07CQH+hcvT=-ZD-r9VNrSrGzTQZBEsuecK_ig@mail.gmail.com>
Subject: Re: [patch 18/38] lib/tests: Replace get_cycles() with ktime_get()
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Fri, 10 Apr 2026 at 14:20, Thomas Gleixner <tglx@kernel.org> wrote:
> get_cycles() is the historical access to a fine grained time source, but it
> is a suboptimal choice for two reasons:
>
>    - get_cycles() is not guaranteed to be supported and functional on all
>      systems/platforms. If not supported or not functional it returns 0,
>      which makes benchmarking moot.
>
>    - get_cycles() returns the raw counter value of whatever the
>      architecture platform provides. The original x86 Time Stamp Counter
>      (TSC) was despite its name tied to the actual CPU core frequency.
>      That's not longer the case. So the counter value is only meaningful
>      when the CPU operates at the same frequency as the TSC or the value is
>      adjusted to the actual CPU frequency. Other architectures and
>      platforms provide similar disjunct counters via get_cycles(), so the
>      result is operations per BOGO-cycles, which is not really meaningful.
>
> Use ktime_get() instead which provides nanosecond timestamps with the
> granularity of the underlying hardware counter, which is not different to
> the variety of get_cycles() implementations.
>
> This provides at least understandable metrics, i.e. operations/nanoseconds,
> and is available on all platforms. As with get_cycles() the result might
> have to be put into relation with the CPU operating frequency, but that's
> not any different.
>
> This is part of a larger effort to remove get_cycles() usage from
> non-architecture code.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

Thanks for your patch!

> --- a/lib/interval_tree_test.c
> +++ b/lib/interval_tree_test.c
> @@ -65,13 +65,13 @@ static void init(void)
>  static int basic_check(void)
>  {
>         int i, j;
> -       cycles_t time1, time2, time;
> +       ktime_t time1, time2, time;
>
>         printk(KERN_ALERT "interval tree insert/remove");
>
>         init();
>
> -       time1 = get_cycles();
> +       time1 = ktime_get();
>
>         for (i = 0; i < perf_loops; i++) {
>                 for (j = 0; j < nnodes; j++)
> @@ -80,11 +80,11 @@ static int basic_check(void)
>                         interval_tree_remove(nodes + j, &root);
>         }
>
> -       time2 = get_cycles();
> +       time2 = ktime_get();
>         time = time2 - time1;
>
>         time = div_u64(time, perf_loops);
> -       printk(" -> %llu cycles\n", (unsigned long long)time);
> +       printk(" -> %llu nsecs\n", (unsigned long long)time);

While cycles_t was unsigned long or long long, ktime_t is always s64,
so "%lld", and the cast can be dropped (everywhere).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
