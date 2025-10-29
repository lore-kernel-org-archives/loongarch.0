Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3BD2E7631
	for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761732599; cv=none; b=h+qz1I8/YOKyRRGwwyuo6IHYf4pqWzmZyn+K1n2PyW4jdAsqqRA81FfNOSbCz69nIP69hrP8VCnOdejH2xXLv+zxAplamCZsKBF2ujoPLZKKIQhc5Z/pcDuTJbcazxXYq0P2jLrZzItErRJjwnINYMZGj1clCWP1oUDvlrcLwLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761732599; c=relaxed/simple;
	bh=fDud/gli0gs0bKQHR8KRS+b9VJUz0ACksoD21DnIixM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=u6xKUKVHC/rLc3+611OlnQtm7V7xREWjQvKITIqe4i/PHI0b+g6qCKSs0NE8XScPmZh6W5S+L93+uGaxxhpQmRqpueonQdCxQwpSAXfcpxH+FuAijnH2IeAUBdIEWN147S3xYhY5opFXQczmQ/K8eP9b+QdRSpwb26qtKLCmDxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TWszmJri; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TWszmJri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761732596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P8VL8F1BbEiYOKI5l4LcZTZfjaaIUn5rioPCVGdYu3M=;
	b=TWszmJriLh3sb/XOvxs0g1/N8dMFiRWbwwGww+WGTJ9MstDMNd3VopUIYJj2LP4PkVkE5m
	+0Ib7Vl3wpueWFiQqZiU5VOGxYquOS33ywvwy7K5NlHmxLoOFN1xOx6crlaIk2gqaGLWeY
	62HVL2zpQyLwAMPalb3S7K2jm3FvilU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-Vsevmv4WMISXVDzA5nx4lw-1; Wed, 29 Oct 2025 06:09:55 -0400
X-MC-Unique: Vsevmv4WMISXVDzA5nx4lw-1
X-Mimecast-MFC-AGG-ID: Vsevmv4WMISXVDzA5nx4lw_1761732594
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3f384f10762so4304097f8f.3
        for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 03:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761732594; x=1762337394;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7va99Zg9nu4+XxtsT3y+i0Qg89ua4ByIHfysL3F+F4=;
        b=MVnEPYa+DuEmBJf00xU6E1++OJziVa+ZUL2towUVhzz3B0SQlgLCLe6iDH8NiMt2Au
         HQNlkp1ODxXuC3FjW+mzZoz6Pt8NibFxs7nhwFCvaXv6wViw7+0FBLtb/LK4l6k33Wqj
         JiE97PZCQgVP/yrmiU3C5asj8X+7kQj8CduYhQTJ/6o3KYa76LJjLP/ATKdG8k11Vpqt
         Hfyp3+kkqlLHud65Ij087V8r/ikkFsevtY6LSJWqCNPBDx99K+EZhqGXvzfXXmX0hx4I
         iqxSJf4JPipPMzXNJFuuLflXgJsUbCRJIC4IRqCmLhBT+vkxVz6jKDQfpcoD2naDztsH
         erfg==
X-Forwarded-Encrypted: i=1; AJvYcCUereVWTZt+26Y/Sjeib6794AQdxdtHq6VyTKETzmMHug6bdeKrJ1UNfHITk+qfr5HZQVBsAHV8vmE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQlEBcdPtZrz5SZRKz6dT95pr308q6gVJOruCOW2Ml/QIONrrk
	v0Dc2FHwjZhK0M9xvL+qhrV1J/ATIg9F6gPHlVqStp7DJpPuEZSdTi5wf1LMUHfcB2RIOvOpuR2
	ekRbEx1GOcMSrNB75Fn7LyANxXokhKWK8syPV4A9Zfz+cARBhmdzItGhQ8Pn1Jg==
X-Gm-Gg: ASbGncsDtDSG0eJmo6Bf71DU0YYn06cfNsr4kFeiRRBJ0Umc54hFqfDJ46m4tj8zf26
	A1ElVcAVqySp/jPumtg4kxVdOh2GhZJitCM4YAHzIILd1r0xYzdE1ol1nrBpAqPi50LB1B3zXcU
	2EGmQjdk3JkfjsYC5UqrYEo1mrj0e7dOdYSxv+5AN8lqVjjUIycC3ElJ2uhzqmXYPQHnllRM1e5
	C5tFk6SagGZp4ekHjAe++Geon3yCZWXc3CDDgncsvX2MJwnnbfr48UkSEIR/ojDW7rAvYS5cqPK
	WmkLBq9qiWvi/OsGba4a+wjgvCAIF1BV1qejNdmKzEUn7WFMVX9X94uEaFgXQPlr/32peTL93gd
	I+khGjMQnQgkmtUWPi6yT/JMKzQE5/G/6qXgXw05eLnoheGQgZuXIt39cU3qn
X-Received: by 2002:a05:6000:2089:b0:428:4354:aa43 with SMTP id ffacd0b85a97d-429aef83083mr1733936f8f.18.1761732594351;
        Wed, 29 Oct 2025 03:09:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMwZOd1Sm4LKIO70Dn8iCGAQm9z32hncQVtTx+dFITCY/jcrLahS/V2gOWr58H4oqqEmvh5w==
X-Received: by 2002:a05:6000:2089:b0:428:4354:aa43 with SMTP id ffacd0b85a97d-429aef83083mr1733872f8f.18.1761732593822;
        Wed, 29 Oct 2025 03:09:53 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952e3201sm25467518f8f.47.2025.10.29.03.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 03:09:52 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Nicolas
 Saenz Julienne <nsaenzju@redhat.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Josh
 Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Arnd
 Bergmann <arnd@arndb.de>, "Paul E. McKenney" <paulmck@kernel.org>, Jason
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
Subject: Re: [PATCH v6 23/29] context-tracking: Introduce work deferral
 infrastructure
In-Reply-To: <aQDMfu0tzecFzoGr@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-24-vschneid@redhat.com>
 <aQDMfu0tzecFzoGr@localhost.localdomain>
Date: Wed, 29 Oct 2025 11:09:50 +0100
Message-ID: <xhsmh5xbyqas1.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nZZoJwg6aCZyx3Qn6CZ2zuNga-nNND7msZjjc-_x2wU_1761732594
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 28/10/25 15:00, Frederic Weisbecker wrote:
> Le Fri, Oct 10, 2025 at 05:38:33PM +0200, Valentin Schneider a =C3=A9crit=
 :
>> +=09old =3D atomic_read(&ct->state);
>> +
>> +=09/*
>> +=09 * The work bit must only be set if the target CPU is not executing
>> +=09 * in kernelspace.
>> +=09 * CT_RCU_WATCHING is used as a proxy for that - if the bit is set, =
we
>> +=09 * know for sure the CPU is executing in the kernel whether that be =
in
>> +=09 * NMI, IRQ or process context.
>> +=09 * Set CT_RCU_WATCHING here and let the cmpxchg do the check for us;
>> +=09 * the state could change between the atomic_read() and the cmpxchg(=
).
>> +=09 */
>> +=09old |=3D CT_RCU_WATCHING;
>
> Most of the time, the task should be either idle or in userspace. I'm sti=
ll not
> sure why you start with a bet that the CPU is in the kernel with RCU watc=
hing.
>

Right I think I got that the wrong way around when I switched to using
CT_RCU_WATCHING vs CT_STATE_KERNEL. That wants to be

  old &=3D ~CT_RCU_WATCHING;

i.e. bet the CPU is NOHZ-idle, if it's not the cmpxchg fails and we don't
store the work bit.

>> +=09/*
>> +=09 * Try setting the work until either
>> +=09 * - the target CPU has entered kernelspace
>> +=09 * - the work has been set
>> +=09 */
>> +=09do {
>> +=09=09ret =3D atomic_try_cmpxchg(&ct->state, &old, old | (work << CT_WO=
RK_START));
>> +=09} while (!ret && !(old & CT_RCU_WATCHING));
>
> So this applies blindly to idle as well, right? It should work but note t=
hat
> idle entry code before RCU watches is also fragile.
>

Yeah I remember losing some hair trying to grok the idle entry situation;
we could keep this purely NOHZ_FULL and have the deferral condition be:

  (ct->state & CT_STATE_USER) && !(ct->state & CT_RCU_WATCHING)

