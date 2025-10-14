Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D1B308F03
	for <loongarch@lists.linux.dev>; Tue, 14 Oct 2025 11:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760440815; cv=none; b=pt9uUxHjy9ggl+MstiesAaTQts6UukFxJt+qszHKIKxoXu3L+/RC4w/4BmbYHd7Z9xL259c42ln+uLefeHd06B/0HRRVe8cQytJ2MP/cHKsv9ypwKMylfexb04orU/S5pZSkuAoR4jhwOBjqIagil+E1MJZBGX6jTk9IUvc6fl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760440815; c=relaxed/simple;
	bh=yX5dyBuNEa2OXACHjn8fnbGsDn2mXnkquyRkiu3aCD8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TBNsfGlOGUqeFCl9ifZHmEfD7+vzxiCYe358edEosUYXjj5Y4tvoiB3U0y5a34QN0Go16iQtth5LywfdNp+bu8A5aawPUco0p8m5EMusZ+LXSX+Gf8PbHn6kYzFmw8KOsr359A2GBjAtPerbPF/p6b1dQ2FTtc9lBaYuM+OHKxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PxZXu5FR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PxZXu5FR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760440812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Imuve1iPcSxB4uVU/yFQsIzQ6zKzpq/61jJo3KbkM2Y=;
	b=PxZXu5FR7pnkY/Lx0rFjkZqXg7+iNO6SSw1bK3Mb4l0vSit3mnPzkbtIZWRppCRg/IdJfi
	cxX51y7dp650gN72tI7XP5RRQvZzUuZsKu8/JHKNUkro+XxDRAIR/dfLQ5Hi++SzerOY72
	Ja/lZgXzVcdx3L3RJ5y0MuQid1gjYVw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-4BKjixrRMGG3cjkGvwVH5g-1; Tue, 14 Oct 2025 07:20:09 -0400
X-MC-Unique: 4BKjixrRMGG3cjkGvwVH5g-1
X-Mimecast-MFC-AGG-ID: 4BKjixrRMGG3cjkGvwVH5g_1760440808
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-46e41c32209so30235405e9.0
        for <loongarch@lists.linux.dev>; Tue, 14 Oct 2025 04:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760440808; x=1761045608;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Imuve1iPcSxB4uVU/yFQsIzQ6zKzpq/61jJo3KbkM2Y=;
        b=BqT1EkbqUWEuN/07JCta/kzLvTlvdbDD7QD0LJrn49QicM5HSYusfllAzEYe5GbBLb
         E3z9EZvhdRwOwCbrMRcvPF9H9t+qPrI2EsZ6u46lHbS5KB8V2fC2LFnTXvVQev1e5VRt
         +iYopgZeIENTPpK1dKvnkBzaWZu77dIBCEwvo69QtouqWg5NtQzpCn4NMjPyzYDUS0/B
         5KrsXvphdP7/QmzgJ3Y8rHSNBXGW2lON6kFGYrlY4cPIu2yFxEt1zsTk8a0MS5rYe23r
         GUkfPTHfPsaXm6yBGLAWbBbA1jICEFjHhNebe2YFYqWufKVpRhVQu6HRN3pHOechxuT9
         0qmw==
X-Forwarded-Encrypted: i=1; AJvYcCWGSnYJEi3DypOZHP1scciKIl/W0l6jNZVvmUNkpHRWmM35gXs41AHHe1O4fLmRhteoMWBEJPOmlDU=@lists.linux.dev
X-Gm-Message-State: AOJu0YybCkYJHYMTjXGsQbd//RAlTICFP/O9D/iQO2M9ANaZhGWAT/CH
	5ROVOYC/WGleIU84L8HVhf+832xZoc9Dfc54tR8J4Edy2hXvKo7FfjsBJ2uTV1uG73xt8nJ7V1q
	gzHIx5jlJQSlxtpbdRBe7SFrAcDXP984CNir7bX4K4vYtJK3ln/IFEErv9j8LcQ==
X-Gm-Gg: ASbGncvjn+dT09xegFEQXU3Cs7BBTpg1OShKIWDOSYMHWs2EtXSfNiw2Yq0P9b9OWX4
	3JpUtZY6nADZkEWLjd3wv0Oq/0lQETNsG86sbdow4WRrPE+FurAf2NMCTZNkhXBblL4Q7Jv+yDV
	jGpojE481bIBQJKrW39ooDACo3JXTcYXqM1Nu+3nQqvjRe49eHrvEMsZ/brG+sxcQhU6oOUO7D0
	6IjaTCKLRHeXfYs4Y+oCLMfxMeR+ZvJW8jM4+flCYPkE09nMCefhl0zdLATQ5OLi+AveWPfrLsU
	l7kCOr+avShd8HEpv46UE2Urj3v0faj50eETWRb5zjtDtsdya4xV847DItLO8P8d+tU+MavBReG
	Cc/N3h+6UtkP5DqB46+h5Wa2pxA==
X-Received: by 2002:a05:600c:37c9:b0:46e:477a:f3dd with SMTP id 5b1f17b1804b1-46fa9b1b18emr175576285e9.36.1760440808207;
        Tue, 14 Oct 2025 04:20:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPNHhJVacE21hOu+c1s40cKBm99NOdKTbqBsl6lzaW/V++U98Y1cwp6CoRkBLGlZny7BSyXQ==
X-Received: by 2002:a05:600c:37c9:b0:46e:477a:f3dd with SMTP id 5b1f17b1804b1-46fa9b1b18emr175576075e9.36.1760440807708;
        Tue, 14 Oct 2025 04:20:07 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb492e6ddsm265506695e9.0.2025.10.14.04.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:20:07 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason
 Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard
 Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 "David S. Miller" <davem@davemloft.net>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, Andrew
 Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Subject: Re: [PATCH v6 16/29] KVM: VMX: Mark __kvm_is_using_evmcs static key
 as __ro_after_init
In-Reply-To: <aO2TKOY5JV9OoRUg@google.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-17-vschneid@redhat.com>
 <aO2TKOY5JV9OoRUg@google.com>
Date: Tue, 14 Oct 2025 13:20:05 +0200
Message-ID: <xhsmhtt01pw62.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EZRSMkP9_syiBSgn7L5h_dDGBBRU6PR5XiR3LNw0e2E_1760440808
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 13/10/25 17:02, Sean Christopherson wrote:
> On Fri, Oct 10, 2025, Valentin Schneider wrote:
>> The static key is only ever enabled in
>>
>>   __init hv_init_evmcs()
>>
>> so mark it appropriately as __ro_after_init.
>>
>> Reported-by: Sean Christopherson <seanjc@google.com>
>> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
>> ---
>
> Acked-by: Sean Christopherson <seanjc@google.com>
>
> Holler if you want me to grab this for 6.19.  I assume the plan is to try and
> take the whole series through tip?

Thanks! At the very least getting all the __ro_after_init patches in would
be good since they're standalone, I'll wait a bit to see how this goes :)

