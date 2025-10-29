Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B2830E0C5
	for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 10:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761733989; cv=none; b=VWG6zj3EN7ycqNn36gZverPv821bH/C/ekBI85tdMihJYGwTuGBIrQ/LIWbwckY48uy7MlbdjBJ3X7nmXTDSGhrVO/2+PWnQ5m77bO8mZHHsyEH43JQDEZ0mI3mucQwSNuh9WTif+AZCBH7NHjdU4MEE+Ms6XQD+RgraN7eaR3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761733989; c=relaxed/simple;
	bh=Q5IYDvPFumVfwvOYxMbJQy+19JoOnyh2TX2vd+zwxmA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ouoifpc1QBbjooAtHZckoNM4JX3uZEhIHqMHitsShdNndXCRs/kbeAml0nBMr7b+XDRfpayc0Y3SIJD8xQkbMrO3x2wMaWltz/y8RJmF+KZ6QZSX3g3f8JI3hT68s6UthSDtLwYw9B3CNGOV0MuR/6egeBgiecVko8PiB/MaA5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aGz4Uj62; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aGz4Uj62"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761733985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8TDebEJmKrapkTDm2SQS84/R7MOsdaEIy1zvcb82V9E=;
	b=aGz4Uj62tPQ5PpVyRlBC+Q+GeWy1wSvUaM6RUGz6q4pBALjCQaTEYVo4VitJ/Q9epTV/1q
	H/IDkPHQtHBBbTqk7OVREn80y+strwKgqFuzyXry+n5m9Py/sM+82SHtapX0rrAxB4tUSK
	ufC47rVkEzbqloR3HRvZIHguD+lWlCI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-ZSQIuzUqMjqoMUkgJnyKjA-1; Wed, 29 Oct 2025 06:33:04 -0400
X-MC-Unique: ZSQIuzUqMjqoMUkgJnyKjA-1
X-Mimecast-MFC-AGG-ID: ZSQIuzUqMjqoMUkgJnyKjA_1761733983
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47496b3c1dcso53689735e9.3
        for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 03:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761733983; x=1762338783;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJM20FESPr5Q3wolT/mFDxUYnwba82V6xz3P+wmiM7o=;
        b=uut7r5dd+s0wp+WgSCoXYy10YPsbrBQOkM4V+Bt8RDzRRXoO4+LHVcX6/tamA/lb4g
         i+zV3kUfgzfzbhtpOGws0h2033u6Pw2ZUkAqT4F6Bs4vuLKyRb1ewwDNs5dfqPFWOeoQ
         EPWug4NyVVXjaltosfeiQn9En5TyP4nl+Q3qPL99dNt5fpjBIYZSk/BUQZeoRdJhm1+i
         Xs9yZLb9j2elYHlCXf+lXyEFAudG+6HUO2MLiJ0nRotcdZE4zOhz5f1isLyHce/rbRnL
         +ZHbnB5ChRJBeMnNJigKM1acwZ4L08kvhxKaNvOdClg9xkhSModT84yoOob9wm9Uuih9
         y34g==
X-Forwarded-Encrypted: i=1; AJvYcCWgPKoek1HA5lezlL/x//khMRZgpPB3ggE1HaOj8yax2Peu8jv18q93TwPNaL+iHJbaVxu4/WgW7wE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/vvo4AMP2BUKDX1rc8vyOK4F3PWYBmTro1X3xg1rHOsaVWdCD
	suxyy+a0KM5jm/rPVvurINHz40TnyrG+JgUoWjNu9tp/AlZfcgJuOxd/REjj+tS+QuG01mRLm10
	1jGtgQ2lorqHXJtVkC0xdaB00vNJDKd5l0h0gEmEQQnLv73KQJlZ8FI8aOS1xIw==
X-Gm-Gg: ASbGncszLmzQMDVJpHN9R6gKBQtkLnDU7NAsgS4tcz/Qx+rmUM8EINPWMud1l7PF+Ti
	Jf0jqUKwcBUWCFao0wiz6gLlRm0MwuQy7jFz18YiYnbpSn5/9nyIV+OqC8BTHlIm5Dj7+kK0yWU
	h9MC7TtJ48tnp/QZukziS/W+nt+TUJyzZtVoXtfyT0dmAszUu7nl70jSQXx1xGnxu72xPnBZ/Nz
	i5uCiKzfRmJhGk1AsJ7MQO30FLNyyLSrbh1Dv0uCIXIcCuLI/+mMqzkAbgkawzEai2+uSpi/lcG
	n+EhbFNpDhp8XgcKoUA2kqXNcxe/by5QmhkbkRdauKuucYgVxWsd9ugckKB88Cx4CuvLNkeQwlV
	A7lebQlvyGrEfywq0y20lu52BD8FleUQp6kiIb+gA4wjG3W18/o2OicOWB+5g
X-Received: by 2002:a05:600c:64c4:b0:477:bb0:7528 with SMTP id 5b1f17b1804b1-4771e1da0c8mr21410295e9.22.1761733982874;
        Wed, 29 Oct 2025 03:33:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxlh/PGW1+wNXuO1RQYN4fEeAqw5AdQXtt4ynjbr63hSK8Qg5GeiiDecSDqHTa53KxpVgVKg==
X-Received: by 2002:a05:600c:64c4:b0:477:bb0:7528 with SMTP id 5b1f17b1804b1-4771e1da0c8mr21408835e9.22.1761733981314;
        Wed, 29 Oct 2025 03:33:01 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b79cbsm25638297f8f.4.2025.10.29.03.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 03:33:00 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>, Phil Auld <pauld@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, "Paul E. McKenney"
 <paulmck@kernel.org>, Jason Baron <jbaron@akamai.com>, Steven Rostedt
 <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, "David S. Miller" <davem@davemloft.net>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, Boqun Feng
 <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Subject: Re: [PATCH v6 00/29] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
In-Reply-To: <aQDuY3rgOK-L8D04@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <aQDuY3rgOK-L8D04@localhost.localdomain>
Date: Wed, 29 Oct 2025 11:32:58 +0100
Message-ID: <xhsmhzf9aov51.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DPPmx2IjnVWNqQK82myyO4zO6kYy7gFj7DDcjQHwIHw_1761733983
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 28/10/25 17:25, Frederic Weisbecker wrote:
> +Cc Phil Auld
>
> Le Fri, Oct 10, 2025 at 05:38:10PM +0200, Valentin Schneider a =C3=A9crit=
 :
>> Patches
>> =3D=3D=3D=3D=3D=3D=3D
>>
>> o Patches 1-2 are standalone objtool cleanups.
>
> Would be nice to get these merged.
>
>> o Patches 3-4 add an RCU testing feature.
>
> I'm taking this one.
>

Thanks!

>>
>> o Patches 5-6 add infrastructure for annotating static keys and static c=
alls
>>   that may be used in noinstr code (courtesy of Josh).
>> o Patches 7-20 use said annotations on relevant keys / calls.
>> o Patch 21 enforces proper usage of said annotations (courtesy of Josh).
>>
>> o Patch 22 deals with detecting NOINSTR text in modules
>
> Not sure how to route those. If we wait for each individual subsystem,
> this may take a while.
>

At least the __ro_after_init ones could go as their own thing since they're
standalone, but yeah they're the ones touching all sorts of subsystems :/

>> o Patches 23-24 deal with kernel text sync IPIs
>
> I would be fine taking those (the concerns I had are just details)
> but they depend on all the annotations. Alternatively I can take the whol=
e
> thing but then we'll need some acks.
>
>> o Patches 25-29 deal with kernel range TLB flush IPIs
>
> I'll leave these more time for now ;o)
> And if they ever go somewhere, it should be through x86 tree.
>
> Also, here is another candidate usecase for this deferral thing.
> I remember Phil Auld complaining that stop_machine() on CPU offlining was
> a big problem for nohz_full. Especially while we are working on
> a cpuset interface to toggle nohz_full but this will require the CPUs
> to be offline.
>

Yeah that does ring a bell...

> So my point is that when a CPU goes offline, stop_machine() puts all
> CPUs into a loop with IRQs disabled. CPUs in userspace could possibly
> escape that since they don't touch the kernel anyway. But as soon as
> they enter the kernel, they should either acquire the final state of
> stop_machine if completed or join the global loop if in the middle.
>

I need to have a think about that one; one pain point I see is the context
tracking work has to be NMI safe since e.g. an NMI can take us out of
userspace. Another is that NOHZ-full CPUs need to be special cased in the
stop machine queueing / completion.

/me goes fetch a new notebook

> Thanks.
>
> --
> Frederic Weisbecker
> SUSE Labs

