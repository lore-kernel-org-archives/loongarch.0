Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E07351FAF
	for <loongarch@lists.linux.dev>; Thu, 30 Oct 2025 10:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761819919; cv=none; b=YclJwFOJcysrI3ZpI3L55I5JgYT+UHYiholqxOIoCXfNzzcIOL0HmMdhXAiQvLIq5Me4w2d96VYJTH1/3Z4ykPeWwlg/uOeqr6qcGItzc/EXYVDAqPKBw1yrlkbz7yEdiA5YDxeN3k2mjpDWZb47L+oqhdh+iatrABAr+jC5uFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761819919; c=relaxed/simple;
	bh=/OiTwmyjWBCx0q96Gsr9SY27ybAo0GLz8Cev2v1IhyU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JBvRBhoJDIqLJoyuX76duMaxQBzm7v/EAEdqjuLPZ58Iq3SvlKNycdvO+HE/AK754MZfvA83U802+6oLmnUorAumRJhuYTzxMnrKrEIwTGm3ZEISDbmLPjVbQ2XFAUu1Lf+ys7xjf2M42tPnEBXQ1yT9kfLa2xOzQ+8pqQTLFdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y6u8EDwd; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y6u8EDwd"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b404a8be3f1so15861566b.1
        for <loongarch@lists.linux.dev>; Thu, 30 Oct 2025 03:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761819915; x=1762424715; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTgIsc3O+wDypaKqBlwZIo86kBPQGfr40arZuVCJ75M=;
        b=Y6u8EDwdJE4qRv7xk104SR3QjeXKUUN61suQkK4ihfL4Lg8YQNygns4HvOGeLvLzbu
         2LbcVykvITkh2qW9KuHt9dp4L2F2gIqJz1E+GElrIQIZb6ayIwRTzpZbgCbI/gkJdPnA
         9Wh4Ri+g/irLKTRtbWvGomDVut+V9sBthVOgW/992FK4untt5GqwXVu43TzU+mrkNdJE
         5Iqn/Yftq4/2HyC1rrK9TIg8NMFxBptRPCCSHT33yC3Z1Lf/E+ZeG/TJ//sYiHlxTgbL
         OsRbi5K/vmjMDmLZrrmU970ctEBQtbRv3FfDAzBzBOcTBrQm6/mE5KDSaDIjsyDaFceX
         HXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761819915; x=1762424715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lTgIsc3O+wDypaKqBlwZIo86kBPQGfr40arZuVCJ75M=;
        b=rbAYYLTuFfBLYThPXaw6p/GLRXcUVA6E7nRpyfmGB0GDGTraeAgQpE1W/1E5ZbfFOg
         BaQrvX5AYmxBkqo2ZC6vJqWePGKa/ZlWqamJvJ2mPvY17Qxq3aX0bIFf37aCW427PzIV
         n8yhG0WUJhtSJ5duAyhwA+X83Zl/jqCcoJfCUszLynhDIDKc7wDAAz7y8KLcN+Qf7Ary
         F7nRFJ6bRq1i2WKw/LagSatzldhCQgjFkhFYdHsKQaxCR5RY/GEj6fhVPKEufVXtdF2G
         tyLiaWnITvcrFmZ5vSVPKvT53ClRkZQfe7JPR2J6XzevwTh78fexwGP/IjB1C3wHRevS
         n11Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwHV0niUMsqhnmpoalknC10Q9Bq6rYM57MK3LMimviGKoxQ+T2FH67L91kAepLH7FmORgZWvJkXag=@lists.linux.dev
X-Gm-Message-State: AOJu0YykSvf4e9Mw2LGIwaG/zINGZalyGIRYBZB7fKghFPO4J1v3egXD
	gYiN4hVsaMSD2lufbe1wY0RWr0k1tnxU/H5dBgpt+KYpstKVAINyBR0yxXp5yOsc0Os=
X-Gm-Gg: ASbGncs2DReEOmVpcZGYISVSZ4L/7acAMfpG9D+mkavjzPVy9CG9IYB2djICP1yhJRP
	PV1jV11JtN6yrcNUR52SOXn/+5eubpD3NrqB038kAjL+UkB5yTye2X+fvFFE2/KhVSaFM5imAyl
	UcjC4NzX9KGXqyaBh4aXJijRL5sn62FuDSLnVXc5YB3qcMymslOZEoGb5CFaHP2WzP6Ws6Xotk9
	zBj6Ok/g+9KTuYHHcCE0d0td4QNsukkx88Fjb4a3VbpGJDTip1B7q92JbFrpX8C2HKV5m/j1It/
	bbpZeqBEKLowci4XUi1bR/Jz/o0MljJEscnJv6Fzug1FI4K7K2bXJf6HAu9PkeUXPPt/IK7JKk0
	SwV/VHnSqTzzCwAYFr8XKUdf+AVj5r/aSnIydRkTyMVMqUpeZEtfKu9SNyiyf5O8lD0NobjDXp6
	MxPvo0JLfCys2oSUwTLidBj2SetoSrCZTWE88J8MYuwUH1D+FDUQaUmsk77TzN5FQM+tvE7YF3t
	J91
X-Google-Smtp-Source: AGHT+IEXsUOIqP3MBMqvuO3EOkZU6BKA34oP58piwLuVoouucxjytl3skX6Ka8nntE+ckkHO79CK6A==
X-Received: by 2002:a17:906:f586:b0:b6d:5439:e668 with SMTP id a640c23a62f3a-b703d55e454mr372826866b.8.1761819915166;
        Thu, 30 Oct 2025 03:25:15 -0700 (PDT)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853c549fsm1728375066b.37.2025.10.30.03.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 03:25:14 -0700 (PDT)
Date: Thu, 30 Oct 2025 11:25:03 +0100
From: Petr Tesarik <ptesarik@suse.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Josh
 Poimboeuf <jpoimboe@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy
 Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason Baron
 <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel
 <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, "David S.
 Miller" <davem@davemloft.net>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, Andrew
 Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Han Shen <shenhan@google.com>, Rik van Riel <riel@surriel.com>, Jann Horn
 <jannh@google.com>, Dan Carpenter <dan.carpenter@linaro.org>, Oleg Nesterov
 <oleg@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, Clark Williams
 <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Daniel Wagner <dwagner@suse.de>
Subject: Re: [PATCH v6 06/29] static_call: Add read-only-after-init static
 calls
Message-ID: <20251030112251.5afcf9ed@mordecai>
In-Reply-To: <20251010153839.151763-7-vschneid@redhat.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
	<20251010153839.151763-7-vschneid@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 10 Oct 2025 17:38:16 +0200
Valentin Schneider <vschneid@redhat.com> wrote:

> From: Josh Poimboeuf <jpoimboe@kernel.org>
> 
> Deferring a code patching IPI is unsafe if the patched code is in a
> noinstr region.  In that case the text poke code must trigger an
> immediate IPI to all CPUs, which can rudely interrupt an isolated NO_HZ
> CPU running in userspace.
> 
> If a noinstr static call only needs to be patched during boot, its key
> can be made ro-after-init to ensure it will never be patched at runtime.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  include/linux/static_call.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/include/linux/static_call.h b/include/linux/static_call.h
> index 78a77a4ae0ea8..ea6ca57e2a829 100644
> --- a/include/linux/static_call.h
> +++ b/include/linux/static_call.h
> @@ -192,6 +192,14 @@ extern long __static_call_return0(void);
>  	};								\
>  	ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
>  
> +#define DEFINE_STATIC_CALL_RO(name, _func)				\
> +	DECLARE_STATIC_CALL(name, _func);				\
> +	struct static_call_key __ro_after_init STATIC_CALL_KEY(name) = {\
> +		.func = _func,						\
> +		.type = 1,						\
> +	};								\
> +	ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
> +
>  #define DEFINE_STATIC_CALL_NULL(name, _func)				\
>  	DECLARE_STATIC_CALL(name, _func);				\
>  	struct static_call_key STATIC_CALL_KEY(name) = {		\
> @@ -200,6 +208,14 @@ extern long __static_call_return0(void);
>  	};								\
>  	ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
>  
> +#define DEFINE_STATIC_CALL_NULL_RO(name, _func)				\
> +	DECLARE_STATIC_CALL(name, _func);				\
> +	struct static_call_key __ro_after_init STATIC_CALL_KEY(name) = {\
> +		.func = NULL,						\
> +		.type = 1,						\
> +	};								\
> +	ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
> +

I think it would be a good idea to add a comment describing when these
macros are supposed to be used, similar to the explanation you wrote for
the _NOINSTR variants. Just to provide a clue for people adding a new
static key in the future, because the commit message may become a bit
hard to find if there are a few cleanup patches on top.

Just my two cents,
Petr T
