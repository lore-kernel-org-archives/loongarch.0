Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F9632779B
	for <loongarch@lists.linux.dev>; Thu,  6 Nov 2025 10:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762423364; cv=none; b=mwMxyh1+mSfwZpc5E4AUgswe2dAjuOLU769xo/0NF1BI/CgcmSCbjTJ5b7PZABDXPZgXR0nds39AS7dm8ZUQQNoGng1CimfrjV8l8AcTkXc+Xc4XXInyIO9/dbRM2F7kmoX30/Vt4Izfi7scR9u7VYQHM+wMZs6XxcO8tCrpsPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762423364; c=relaxed/simple;
	bh=BYltfSMqnA7SOq+qPW36sjrfm2FOG2DWsVcGzNNuODA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o0NJt+YjyO2afHOpK7DKnwg16mX1Qmq4x2k8G5yk4oje6/AprHsfB5Y3ximSvRY3N3D6FXNMw0Xg2HLHaxIOcpn8p3QJaBd4/dom4SFE/URwfWJ9vtZGMzz/mh0x+FkEbYs12tTqHUuSMCHfxlP5rPuiPylc4Bu4Bz9+7k1TYHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FhjjEN2v; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FhjjEN2v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762423361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MVdSTjzPPKZ2l7IW0u0zSr5SxYY9yMb26AdkoDhOwNg=;
	b=FhjjEN2vZVfmDXQEufdyF6W7YDyeag0BD2LBg9wKDSyUMmxe+ib+dLjx8mMI3JJWpcnqLf
	0wXD9FFkfrPSCyvsDmcvbopjVUeV9r7Owky3I2RGZi+0/MyuC5tsz0UqVxAHZQMsKnXOJw
	1jdt4zIj+QzoJOnxpCpKd/DPy6LNcVs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-nxOQcEXnMfSNYcDQi6ODaQ-1; Thu, 06 Nov 2025 05:02:38 -0500
X-MC-Unique: nxOQcEXnMfSNYcDQi6ODaQ-1
X-Mimecast-MFC-AGG-ID: nxOQcEXnMfSNYcDQi6ODaQ_1762423357
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-429c8d07874so421994f8f.3
        for <loongarch@lists.linux.dev>; Thu, 06 Nov 2025 02:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762423357; x=1763028157;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tvrt5C8X1gp1kp6b+KY8cbLTeVcvbbT6G6kNQJkblK8=;
        b=FaytjMEKOW70+0QqwLTemH6FgPtuGBKY0om56jYZnvx9gzu3PsDNLg/kGPwqHZ2ZNi
         m9kTihRL+fG1h0KD/a9eE8tnO8cLYYm2BKznadv9trCqLLP9Td1qcPkzahfgxmuXat1c
         ns9Q5zemvsivwS4Zk3x/hOHBntFY5IsfVRaUyf0bTEMWNnWqFEiwIwJlVDB2Mo4toqHy
         EOm27Opa+JWI9Bl5Ck0u3q8fGbls6BcNSiBPpSWg3Ap15iSdySXxV/l57PTjb3b0GM+B
         wmlTroL+vr4fVM++DH7GN9bX3NAOVX3TnOU+5fGY4nfG8xuUQg9lSTnbmPo33nFz7cRc
         fc5g==
X-Forwarded-Encrypted: i=1; AJvYcCU/mdpUebM+iUE43IKVoevg3/aXhPAZBqB5H9iyWXpQfeGqYnD4D0BwWPFH7R8siZuJNK29/ANKQcA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyiO0w6CaDEwt7Tn5UMlCUYNk2DvtHyWCKZ5cdnO4MTX2fxroYU
	IfUE213fDrpmg7EucChmSoHcdrqnkFCH6D3Sn6iWHFC5p7++2yaloOYXyafIY9KSCqO1ubAFIb4
	5oCSEmX2FuohueKNWliNZL2bxx6UjP/loYL7A0uU5XgD9yp/TlfJ5vh60BLKwSw==
X-Gm-Gg: ASbGncs0B5hTTSs+RwgxP9rduuVA9nukVnRJHfOA8lxC1smcZrB+qcLbs1a2D4PZJzN
	8XECsZIKJsuWcKRy59ffhH+6uDICAVMiG4P5LSs5xphqKCi2y9etUgB0zQywzpd3hGEo5UMXyIO
	Kdk8+kBOxJ57AAay51mCCH6VWooy12xRPkt+7rT7Ds37nqKYfgKmX/bGg9uOQDy8Utll9bPM4Nw
	DMuCoeayVx7UPBDFORDSVtEoO95b0Yie7O8f3nzUYWk0fMb7sWg7MeuMHoaeEQlpxKAN2Dr1c3y
	kAHSE9/+Rw/zki5cHn0TeCTlcZyxhc6KRPfOlWBV8m9oZFk2ii8GT8ai41vTcandigsvWYKWdEp
	62vLYiz+wc5B/C3yDdwowsFF/ie9q7FqpceIsVU254/Vx+KTJr0Cvn+zH7Hab
X-Received: by 2002:a05:6000:2007:b0:429:bd09:e7ce with SMTP id ffacd0b85a97d-429e32e3751mr5572180f8f.18.1762423357257;
        Thu, 06 Nov 2025 02:02:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFeAmOLmzeYzGPgujTP1e064ll50Q3Ih/Pj2s9y519WV4ZUw6Tz0GJFNvPvZOTYQG+myOLaw==
X-Received: by 2002:a05:6000:2007:b0:429:bd09:e7ce with SMTP id ffacd0b85a97d-429e32e3751mr5572131f8f.18.1762423356748;
        Thu, 06 Nov 2025 02:02:36 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb477203sm4112751f8f.29.2025.11.06.02.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 02:02:36 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Phil Auld <pauld@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, rcu@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Arnd Bergmann
 <arnd@arndb.de>, "Paul E. McKenney" <paulmck@kernel.org>, Jason Baron
 <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel
 <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, "David S.
 Miller" <davem@davemloft.net>, Neeraj Upadhyay
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
Subject: Re: [PATCH v6 00/29] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
In-Reply-To: <aQuNdOEmPYkI03my@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <aQDuY3rgOK-L8D04@localhost.localdomain>
 <xhsmhzf9aov51.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <aQJLpSYz3jdazzdb@localhost.localdomain>
 <xhsmh8qgk5txe.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <aQuNdOEmPYkI03my@localhost.localdomain>
Date: Thu, 06 Nov 2025 11:02:34 +0100
Message-ID: <xhsmh5xbn5vid.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OTQAm4pz_YjwQTXf5mym4Hj5sl0pVPeK85MHmUaN70o_1762423357
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/11/25 18:46, Frederic Weisbecker wrote:
> Le Wed, Nov 05, 2025 at 05:24:29PM +0100, Valentin Schneider a =C3=A9crit=
 :
>> On 29/10/25 18:15, Frederic Weisbecker wrote:
>> > Le Wed, Oct 29, 2025 at 11:32:58AM +0100, Valentin Schneider a =C3=A9c=
rit :
>> >> I need to have a think about that one; one pain point I see is the co=
ntext
>> >> tracking work has to be NMI safe since e.g. an NMI can take us out of
>> >> userspace. Another is that NOHZ-full CPUs need to be special cased in=
 the
>> >> stop machine queueing / completion.
>> >>
>> >> /me goes fetch a new notebook
>> >
>> > Something like the below (untested) ?
>> >
>>
>> Some minor nits below but otherwise that looks promising.
>>
>> One problem I'm having however is reasoning about the danger zone; what
>> forbidden actions could a NO_HZ_FULL CPU take when entering the kernel
>> while take_cpu_down() is happening?
>>
>> I'm actually not familiar with why we actually use stop_machine() for CP=
U
>> hotplug; I see things like CPUHP_AP_SMPCFD_DYING::smpcfd_dying_cpu() or
>> CPUHP_AP_TICK_DYING::tick_cpu_dying() expect other CPUs to be patiently
>> spinning in multi_cpu_stop(), and I *think* nothing in the entry code up=
 to
>> context_tracking entry would disrupt that, but it's not a small thing to
>> reason about.
>>
>> AFAICT we need to reason about every .teardown callback from
>> CPUHP_TEARDOWN_CPU to CPUHP_AP_OFFLINE and their explicit & implicit
>> dependencies on other CPUs being STOP'd.
>
> You're raising a very interesting question. The initial point of stop_mac=
hine()
> is to synchronize this:
>
>     set_cpu_online(cpu, 0)
>     migrate timers;
>     migrate hrtimers;
>     flush IPIs;
>     etc...
>
> against this pattern:
>
>     preempt_disable()
>     if (cpu_online(cpu))
>         queue something; // could be timer, IPI, etc...
>     preempt_enable()
>
> There have been attempts:
>
>       https://lore.kernel.org/all/20241218171531.2217275-1-costa.shul@red=
hat.com/
>
> And really it should be fine to just do:
>
>     set_cpu_online(cpu, 0)
>     synchronize_rcu()
>     migrate / flush stuff
>

That's what I was thinking as well, at the very least for the
cpu_online_mask bit.

> Probably we should try that instead of the busy loop I proposed
> which only papers over the problem.
>
> Of course there are other assumptions. For example the tick
> timekeeper is migrated easily knowing that all online CPUs are
> not idle (cf: tick_cpu_dying()). So I expect a few traps, with RCU
> for example and indeed all these hotplug callbacks must be audited
> one by one.
>
> I'm not entirely unfamiliar with many of them. Let me see what I can do..=
.
>

Here be dragons :-)

