Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E307C2D77F7
	for <loongarch@lists.linux.dev>; Mon,  3 Nov 2025 08:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762159061; cv=none; b=dcgK+tjZvtfA7kmqBo8kQ/HPCO5L/BvAPA4DIpRPQRkGcBWWMmPdbjsat+BBPDwN+Q5qV4dSUnC3aK1adsrGvmPLBbLYmOAz97dC87fuVk/eierAISKkHF7JOn8RLSnTTIHnQYyIHA0uChqw0FMYy7w6zgWN9ygw88TwZ0T/3jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762159061; c=relaxed/simple;
	bh=VPQocaf6gUl8BS3pejlUrKCB/3VeiYl/8q6ahm5+LvI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GTk+mAbcO98R7auPKyPcC23J8BcsGsWmmHjaqIoo2+yitPidSL4lemsAemCIA0jMPosuHIX6pf5Ygp4va1RqELuw6gXlZuI2x5KasxUTizu7/Zy/gG+ruX9ptAFuLS0eEAmcIfGSX2qzCEJfwXQu3GjNaMggc3LEp4l16ecCaKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BmBK/fV9; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BmBK/fV9"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64075080480so685394a12.0
        for <loongarch@lists.linux.dev>; Mon, 03 Nov 2025 00:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762159057; x=1762763857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6+8IBdXCcTU6eZ4JMuY2we8/fQYN6+oBue210uWprk=;
        b=BmBK/fV94GxNbUSI5e7jXUcDV8HeBDS1BR9iX9Sv1Wedg12SVlI0hQ7CCCW4LikVdS
         sWrxi92SHCYoBNS6J8hOaSeQngBvff5/KpSOm3daZApAmJb4CO7WUdAKSGs8MJZjg1Hx
         Z6UbjnFSatO+bYQngCLylkV0N2HJhrQxDtSDyE24gq8U2og3dyo87DokNBtO8viuABs+
         LLl5LS5X2s8WVSpCrHIkIbGA9IeOgNnSjarGfVcTIXuTc2imJCA+xhh7P68nH8mgv7wG
         k1CrkvldvGdDuPqac6od2y/2/8ZTPjpghTq+IZ2q0bceqlGw9TQVszb7Ya+4Su4OHCwY
         TCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762159057; x=1762763857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6+8IBdXCcTU6eZ4JMuY2we8/fQYN6+oBue210uWprk=;
        b=U0zAJKUbVky5dAm28IUCIz8Q8dual7h0bRCllssk8qy7AWDeiJUCokuLmj9zRgEWQs
         QwXXANE5Uh79mv28wOYjQ/VjQrLwoeS9hTPeftEenpXaAs50pdueEER+nAMIjuTYAhS5
         oAJgJNSnHrCsTHJ1+YOqzsJ5L9sQOvOmfkpjdDiR8QmO/s4WyEtHIKOi7sXn8Eu/qQTm
         u84IJ168hBeSrBBXeNVWvtATmtOS32qaeW4NmrWncRpmQDveIZct0l7lxDgg/bZxVu6w
         nQIBNnEvsqOvE2yIQHJvq7QG9aBSOrY9XmS2qwgFiy1yeUGZW9XCyR45sKeHUDzXsAJ6
         wAMw==
X-Forwarded-Encrypted: i=1; AJvYcCVoWINKyvuJGL8KTGkw9p1kDy0IovrlYkKqJOPhIXyhzIPfC69gAT4r9hbrDaDCfK6NwVVjlOgHCb8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTc0YB5zdN9wTX1oPgS5wyM9DweX3cYe8jIivi88MwHNhWar/i
	u9hsSFLz28w5bPZSIXjosPmY5qS2aBXfFFhFzmK17LPYd9lUknV6bqs9vtDqqHiKzGY=
X-Gm-Gg: ASbGnctJo4r+bt0sLIVKI7DFKwdrLZxtNDY7DkpsteICCKlzRPPJ19qfP0+jqBJwqmu
	KnoupiUAGAIkmjDIDHL44gTMz2jofwxBwP/BL+gaEO6O7wlIXJbFTbJu42L1GQYyQfclqH+rzdA
	GjNVKHotp128YXOEkbAB2HwT84xVwpgMcCYUnOafXVqm2TW4brBWKT2hTJyeP1EfcppxwBe/PcL
	yu/2m5HQEPHBivo6zKwPSSlGyWvWkkiUftAqwJ+RPkkN7ucZyJvTgZCRavL7lUgmLJD79DgIJtw
	nmuCOSxAQ/8lB4U3mb7M4ctHfe4v5tqXq/zrwgVoNeE5potBTWEdbYzgUOw+/12OKtCF8ivq6I4
	K2x/mLLj+UPJl3CCdbsdqzJGJIqBYR9vM7B8uEhPu4xHO0iyozyYboiOlkwJq7cs/XvBkJ/CamM
	bxIJLcd8PAlttbsIE+k0S+8TQvOum29fW19H9sgua7cqqhlKQzgvMBob4AYZ5dd2fAiHFVO9OC+
	Y5D
X-Google-Smtp-Source: AGHT+IEXAMzB4Q3iZseWqc5EI+3z01yD/lkzyZQiHdGqXZRiWGSYaalZ7FPGcsDnEnqBbvKYbK1akQ==
X-Received: by 2002:a05:6402:27d3:b0:640:9eb3:3683 with SMTP id 4fb4d7f45d1cf-6409eb34460mr3244974a12.1.1762159057100;
        Mon, 03 Nov 2025 00:37:37 -0800 (PST)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b428119sm9012005a12.24.2025.11.03.00.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 00:37:36 -0800 (PST)
Date: Mon, 3 Nov 2025 09:37:28 +0100
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
Message-ID: <20251103093728.031042d0@mordecai>
In-Reply-To: <xhsmhqzujp9t3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
References: <20251010153839.151763-1-vschneid@redhat.com>
	<20251010153839.151763-7-vschneid@redhat.com>
	<20251030112251.5afcf9ed@mordecai>
	<xhsmhqzujp9t3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 31 Oct 2025 12:52:56 +0100
Valentin Schneider <vschneid@redhat.com> wrote:

> On 30/10/25 11:25, Petr Tesarik wrote:
> > On Fri, 10 Oct 2025 17:38:16 +0200
> > Valentin Schneider <vschneid@redhat.com> wrote:
> >  
> >> From: Josh Poimboeuf <jpoimboe@kernel.org>
> >>
> >> Deferring a code patching IPI is unsafe if the patched code is in a
> >> noinstr region.  In that case the text poke code must trigger an
> >> immediate IPI to all CPUs, which can rudely interrupt an isolated NO_HZ
> >> CPU running in userspace.
> >>
> >> If a noinstr static call only needs to be patched during boot, its key
> >> can be made ro-after-init to ensure it will never be patched at runtime.
> >>
> >> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> >> ---
> >>  include/linux/static_call.h | 16 ++++++++++++++++
> >>  1 file changed, 16 insertions(+)
> >>
> >> diff --git a/include/linux/static_call.h b/include/linux/static_call.h
> >> index 78a77a4ae0ea8..ea6ca57e2a829 100644
> >> --- a/include/linux/static_call.h
> >> +++ b/include/linux/static_call.h
> >> @@ -192,6 +192,14 @@ extern long __static_call_return0(void);
> >>      };								\
> >>      ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
> >>
> >> +#define DEFINE_STATIC_CALL_RO(name, _func)				\
> >> +	DECLARE_STATIC_CALL(name, _func);				\
> >> +	struct static_call_key __ro_after_init STATIC_CALL_KEY(name) = {\
> >> +		.func = _func,						\
> >> +		.type = 1,						\
> >> +	};								\
> >> +	ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
> >> +
> >>  #define DEFINE_STATIC_CALL_NULL(name, _func)				\
> >>      DECLARE_STATIC_CALL(name, _func);				\
> >>      struct static_call_key STATIC_CALL_KEY(name) = {		\
> >> @@ -200,6 +208,14 @@ extern long __static_call_return0(void);
> >>      };								\
> >>      ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
> >>
> >> +#define DEFINE_STATIC_CALL_NULL_RO(name, _func)				\
> >> +	DECLARE_STATIC_CALL(name, _func);				\
> >> +	struct static_call_key __ro_after_init STATIC_CALL_KEY(name) = {\
> >> +		.func = NULL,						\
> >> +		.type = 1,						\
> >> +	};								\
> >> +	ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
> >> +  
> >
> > I think it would be a good idea to add a comment describing when these
> > macros are supposed to be used, similar to the explanation you wrote for
> > the _NOINSTR variants. Just to provide a clue for people adding a new
> > static key in the future, because the commit message may become a bit
> > hard to find if there are a few cleanup patches on top.
> >  
> 
> I was about to write such a comment but I had another take; The _NOINSTR
> static key helpers are special and only relevant to IPI deferral; whereas
> the _RO helpers actually change the backing storage for the keys and as a
> bonus are used by the IPI deferral instrumentation.
> 
> IMO it's the same here for the static calls, it makes sense to mark the
> relevant ones as _RO regardless of IPI deferral.
> 
> I could however add a comment to ANNOTATE_NOINSTR_ALLOWED() itself,
> something like:
> 
> ```
> /*
>  * This is used to tell objtool that a given static key is safe to be used
>  * within .noinstr code, and it doesn't need to generate a warning about it.
>  *
>  * For more information, see tools/objtool/Documentation/objtool.txt,
>  * "non-RO static key usage in noinstr code"
>  */
> #define ANNOTATE_NOINSTR_ALLOWED(key) __ANNOTATE_NOINSTR_ALLOWED(key)
> ```

I agree, this makes more sense. Thank you!

Petr T
