Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD16230BD5
	for <loongarch@lists.linux.dev>; Tue,  4 Nov 2025 13:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762263967; cv=none; b=B1Yhutde3qYQJoUBz/HOLj4OZ4BPVHa3klVDUq2luKFt0+Fv9K3vRiBt3OcZodB4THbAsnkB3AgzB4s/mw/Np4eJt4DiITgfjbkOLwAug5OdOcWSUZzGOa3hOUiKTg0vTgEXAVG/AX+iJjStEpxuwjMulpYeGvhGak3Wj2exmUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762263967; c=relaxed/simple;
	bh=6ox1zLtoIs3WHKjGHBqzO0nCO9DbDq7atxZ/hCyqdAU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Tma8kvu+DTKMjU50aetIGkfdVNEmvZ3VBq78hTIwQVPVVo/BxGJznx8d2PIwbEp+O34kS2kKl1oXXpeDuG5ymSYs1LsTGR2SQBuQ+3bkSRya6fWzZRm21gnba8h/E8Cgak6W69D0qVO+kD1P0TGtokMagwghZgrxyFDSDWQ9Pag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IWN1Kpr4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IWN1Kpr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762263964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qBb4JYjcOHMwFtnHDJyHLJFdY3oY5dMhkeGhI5Dhsqo=;
	b=IWN1Kpr40kfs0YnBKC9M4Cuk7ev00HsghXjJSLPGebY+sWzvIgyz6g0ZnhZGFKud/++r6l
	feVWduJAQMVOdNL2h84Svl8h2mKsykHrzIDr9kjFrazlYHhoW2ls1Bcg+p9lV6sS7n/Obz
	dXr8pjVlDt0rC2qEynbnNURJgw8lmxY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-h6WNcLTWP8-2JOPFdXvRsA-1; Tue, 04 Nov 2025 08:46:01 -0500
X-MC-Unique: h6WNcLTWP8-2JOPFdXvRsA-1
X-Mimecast-MFC-AGG-ID: h6WNcLTWP8-2JOPFdXvRsA_1762263960
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-429cdb0706aso2420518f8f.0
        for <loongarch@lists.linux.dev>; Tue, 04 Nov 2025 05:46:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762263960; x=1762868760;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBb4JYjcOHMwFtnHDJyHLJFdY3oY5dMhkeGhI5Dhsqo=;
        b=GeZPR0UvcgMYZqtBF2abOEpzXqDpgm3sasowl4zZO2yt8a33srJw1VVYutskJJ1QVx
         ikxogc5BAT1mo7DLXSCapg6TYMWfEr1qlfbi2ydFGopuPZBcwAbjjF30twsX65A37OlT
         8tbAlMxhVsrBJ5CNk1FbKVjWb4c11KM0nc/BG6gvHU4rkKKo18QEJTPqJ0L7FXUJ/3GL
         2KTVqqe11V0thWWD9+5FEGb/8cdqehN6B6HSXGS02MhZ/AUulUJnt9Ih8F3f/GfIvUDh
         C2f/y9bKB8qH3XCLie5/qCLoYz6Rro2sDuKOAPbQFXKoxFwKMnPbrho6CpOngxMYiW/M
         muKA==
X-Forwarded-Encrypted: i=1; AJvYcCUkKAYTGp9DyM2elwVZKZpFNtvdax/SSeLkdcWRDH3nkmJS0A6k+6kU1YThplifRk+e80ybkAuvMmY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzK4eLwCOHtWwWty7Iv2JnE5gDqWuJnEaBsCEXrcN8lK6OIJb3s
	ebem61/blTzqXFuM4wH8kV+FyybR6kQ8DozLcsLO5bbJT3oQBBTxAc1UYCyxl1Ko4dSOYct8loa
	S1NgGCJDGKjE1/2vo3hYU4RMiQo1xFTEbG10Miax7TRB5SM2n7OML703Ppp/Wew==
X-Gm-Gg: ASbGncsbOnK9qarmDw/1ym2qPTHcbHO6gh1kXmg37FAnJ5FEXd97nkCnjyoUnNo11Ns
	u7Zi87/X2NdRGxepAkDl2VswchtYiqAA/fzi/f31Z1EQXQUz6k5kGe8Kfu6vXYvGvflsJvKVzH+
	wc+WNTsGJtzM0rhkRKH8OcONEhSYBx2xuUEo0dUajf7xyIcW04RFx0YK333HPTv6jFzxBrUb2Fi
	LoJYzAnuT3l8yamp5v/PNtbJ1QYg4srMA/JohUTHWPg1eqlqXFsUlpviqpzeoavyR30bKPJWx5p
	HMbDraZCuHrWSBejy7Svxhrx6X8bUuUiBOUpj1AE7dEkqonUOksmJ0gcUxRlebUv025XvNo9Pze
	bswxr5NPnLN9Z3naWRh4tRxC3zCXYgLElSCE=
X-Received: by 2002:a05:6000:22c9:b0:429:d11b:9ec4 with SMTP id ffacd0b85a97d-429d11ba360mr6284600f8f.41.1762263959567;
        Tue, 04 Nov 2025 05:45:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRnKz3y+r5XoY3ls/nBZPt8sht5PzwdeS+jf9m1q52xASXswgB53muxrTyL7Mvrv/sZwgkKw==
X-Received: by 2002:a05:6000:22c9:b0:429:d11b:9ec4 with SMTP id ffacd0b85a97d-429d11ba360mr6284574f8f.41.1762263959010;
        Tue, 04 Nov 2025 05:45:59 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb ([2a01:e0a:36d:2b80:e937:44f0:a96a:94f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1a8528sm4959089f8f.21.2025.11.04.05.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 05:45:58 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Nicolas Saenz Julienne <nsaenzju@redhat.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Josh
 Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Arnd
 Bergmann <arnd@arndb.de>, Frederic Weisbecker <frederic@kernel.org>, "Paul
 E. McKenney" <paulmck@kernel.org>, Jason Baron <jbaron@akamai.com>, Steven
 Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Sami
 Tolvanen <samitolvanen@google.com>, "David S. Miller"
 <davem@davemloft.net>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>,
 Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mel Gorman
 <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Masahiro
 Yamada <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v6 23/29] context-tracking: Introduce work deferral
 infrastructure
In-Reply-To: <dee4dc13-b187-42df-93ce-f738cfab32ea@linux.ibm.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-24-vschneid@redhat.com>
 <dee4dc13-b187-42df-93ce-f738cfab32ea@linux.ibm.com>
Date: Tue, 04 Nov 2025 14:45:56 +0100
Message-ID: <xhsmhjz05ud0r.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ELVmGQs3ocBg2-jBLPa-37KjsXhXY1VPiMEvXy1Dw5g_1762263960
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 03/11/25 14:02, Shrikanth Hegde wrote:
> Hi Valentin.
>
> On 10/10/25 9:08 PM, Valentin Schneider wrote:
>> +++ b/include/linux/context_tracking_work.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _LINUX_CONTEXT_TRACKING_WORK_H
>> +#define _LINUX_CONTEXT_TRACKING_WORK_H
>> +
>> +#include <linux/bitops.h>
>> +
>> +enum {
>> +	CT_WORK_n_OFFSET,
>> +	CT_WORK_MAX_OFFSET
>> +};
>> +
>> +enum ct_work {
>> +	CT_WORK_n        = BIT(CT_WORK_n_OFFSET),
>> +	CT_WORK_MAX      = BIT(CT_WORK_MAX_OFFSET)
>> +};
>> +
>> +#include <asm/context_tracking_work.h>
>> +
>
> It fails to compile on powerpc (likey any arch other than x86)
>

Woops, thanks for testing!

> In file included from ./include/linux/context_tracking_state.h:8,
>                   from ./include/linux/hardirq.h:5,
>                   from ./include/linux/interrupt.h:11,
>                   from ./include/linux/kernel_stat.h:8,
>                   from ./include/linux/cgroup.h:27,
>                   from ./include/linux/memcontrol.h:13,
>                   from ./include/linux/swap.h:9,
>                   from ./include/linux/suspend.h:5,
>                   from arch/powerpc/kernel/asm-offsets.c:21:
> ./include/linux/context_tracking_work.h:17:10: fatal error:
> asm/context_tracking_work.h: No such file or directory
>     17 | #include <asm/context_tracking_work.h>
>        |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> Gating works for compile, but no benefit of the series.
>
> +#ifdef HAVE_CONTEXT_TRACKING_WORK
>   #include <asm/context_tracking_work.h>
> +#endif
>

Huh, looking at this I wonder why I shoved that here. That include belongs
in context_tracking.c itself; I'll fix that.

>
> I have been trying to debug/understand the issue seen with isolcpus= and
> nohz_full=. system is idle, even then it occasionally woken up to do
> some work. So I was interesting if this series can help.

Is there some ongoing thread for this particular issue or is this just
something you're experimenting with?

If you suspect stray IPIs hitting isolated CPUs I'd recommend tracing with
these events enabled:
  ipi_send_cpu
  ipi_send_cpumask

