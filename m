Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F412EFDA5
	for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 10:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761732993; cv=none; b=f2EEwy/5KlKCeYgNcD1RjR+OFbQAns1DPvydKIU7WEOnhB+ncIPYx7tOe+ODNnP5+98eFyH2GgKOVTUW/0Fpvm1M/PRQFAET1VKCBjhR83hGS4ktMJD458CGynHCt7vBhkpzKYiOtMzHb8R2XYNMlK1PGJ/tIGKIlr5xDXTvK/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761732993; c=relaxed/simple;
	bh=y4PwAyJZ8Gj6V27puxA2P2xQYlP9Ps1a+TkaNWf53EQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I/6dgg41LoCTncdySIPan+t3EIjnKnHOjQkkNK4QWM9hcDSXMQtRUkOuEyJ50AdGfUmUFVnALRZKo9F5nAYTzkQBOiHEJ+k1JnUMJpgrzletRsI1+xfodPRqygRDaD/TPy/o9GCdjQhSUamd4sFlIIm23BKkzmTmVoQTwvSYK/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rxw0NLQ/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rxw0NLQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761732990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lSbP/XItnE8Eu8etTuS9l9QrebV4lnCgmZKR5M55TVw=;
	b=Rxw0NLQ/alZvJ+i/TRgwVROo5tXszuKQ+ctU5HQ1KE7uwu33C5WOQC63Thq77Q53OAn4Dw
	dov50TPFYGgJAw7Tf+WCBGBw/Qr9nuxuIkI4bPqJEEZl2oXpg9/dUkkZyw5x3lEKfcvXHC
	yrqiE0PJNv6d/msIH19CxotCyu5+d88=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-4vgb8U3IOtqCygh0izVXzw-1; Wed, 29 Oct 2025 06:16:27 -0400
X-MC-Unique: 4vgb8U3IOtqCygh0izVXzw-1
X-Mimecast-MFC-AGG-ID: 4vgb8U3IOtqCygh0izVXzw_1761732986
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-471201dc0e9so40197325e9.2
        for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 03:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761732986; x=1762337786;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/btFKEFxhLEeC8J1xdXSDjZgEcY68zMIb5ZfPzXsUAI=;
        b=Y6g0cUftOfYmHbDOH6jHE8YtXpZ8N2jPVPmOuXvvJZ9ZlZECEIGQUcaJb7Ck6p/BVL
         8lW7JgVU78zm/Gjj4RaKq0afS+vu1Z3KYqaK9gTE49xrQIifGDHWrO56Tsz6dgc+PYaM
         A5n+rpy947MaxxR1G70viQkIqCz/FXB1pxug4LTX/tHWpy5jySdPkvmVd7bUh2keomM6
         XkMwwEf9uqwdVV9U1jXSKcs46xIYYdEIu35ok8v9GeUQaRCLCEJRHMtIb7OOvCx0UgIA
         Z+zCIrBLdXy+gLFi0A10eZe/GUl4MHceUeWT85TNruv6duGgXPzVyuduj7C6lX4nQc5p
         MiyA==
X-Forwarded-Encrypted: i=1; AJvYcCXtBl+21myiOLBMKKIKNeJ1Wo3sIKKI9NvBsniY1F0r0MvE7Dn5Z0lYdBRmGQ5mONLtfylQrbV+wj4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzK3tcWT2Vw6O0n/lVZm+ZBeKsI9gH10YsZvoqqLGWamFZCoVcK
	wW/BnYL28vBrr2Tho/MaVBQdapecrAwtOEyiiLypcgNsdtDELeftaJlieCWUdSvZfepilnK7PIQ
	fScqp4Ns5uj3ZsBDAzpwg3D832vRMLxFj75PlOBwnpJSVndq2+cg6tDv2VktEtQ==
X-Gm-Gg: ASbGncvTX5mYk01dzH2iREvOiqOMARcStCHreBejeB1sSgy5+m+cvSquzSRM31/3P5r
	V7jOkMxRaEAERBjIL4P+cPm0/wM4EqeCJI/5MKgqeBJS012eupUYHuQbFiEIuo7dHgSyCsGcIC1
	kmQx9H5i3SgQwHY/+mqRxl/lf04Q++30Tapcbd27RTn1b6pXqGZYxRT1N9yOx1WyH8CQzoHIJ/m
	zdNOZpAGPrAK4sqC+e2a2A5IpzoPm8uoQb3CgOZJ0Nlm/W1g+FoF9tuEOvSDQFt4sRNd8k4vX0y
	QzJiSWiYeV0g2dy3ai17qIxs/PRVa+NmHvYv1Q+uEvP7jZSSAcWQd+Gw/YBZiWV2HeIPA8QSXsw
	O+YLdf15nQcXjIMxR3QZPb1ifZhsdCCSBenUFQiH4BCCtlFA2kyB/ObydIIL1
X-Received: by 2002:a05:600d:4398:b0:475:dae5:d972 with SMTP id 5b1f17b1804b1-4771e85156emr13218755e9.23.1761732986086;
        Wed, 29 Oct 2025 03:16:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENaoAuowDmNKRs2e7mInj3dgyeHZe08An/EQmhaeEKImjMyXA9vgcPYVOhC1MZ8t+wInccTA==
X-Received: by 2002:a05:600d:4398:b0:475:dae5:d972 with SMTP id 5b1f17b1804b1-4771e85156emr13218175e9.23.1761732985564;
        Wed, 29 Oct 2025 03:16:25 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b43sm25828786f8f.6.2025.10.29.03.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 03:16:25 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
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
Subject: Re: [RFC PATCH v6 27/29] x86/mm/pti: Implement a TLB flush
 immediately after a switch to kernel CR3
In-Reply-To: <aQDoVAs5UZwQo-ds@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-28-vschneid@redhat.com>
 <aQDoVAs5UZwQo-ds@localhost.localdomain>
Date: Wed, 29 Oct 2025 11:16:23 +0100
Message-ID: <xhsmh3472qah4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FHGbAhPBWn1jadkwL8NUY9Qlm-RODofODNyusI-nNsA_1761732986
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 28/10/25 16:59, Frederic Weisbecker wrote:
> Le Fri, Oct 10, 2025 at 05:38:37PM +0200, Valentin Schneider a =C3=A9crit=
 :
>> @@ -171,8 +172,27 @@ For 32-bit we have the following conventions - kern=
el is built with
>>      andq    $(~PTI_USER_PGTABLE_AND_PCID_MASK), \reg
>>  .endm
>>
>> -.macro COALESCE_TLBI
>> +.macro COALESCE_TLBI scratch_reg:req
>>  #ifdef CONFIG_COALESCE_TLBI
>> +=09/* No point in doing this for housekeeping CPUs */
>> +=09movslq  PER_CPU_VAR(cpu_number), \scratch_reg
>> +=09bt=09\scratch_reg, tick_nohz_full_mask(%rip)
>> +=09jnc=09.Lend_tlbi_\@
>
> I assume it's not possible to have a static call/branch to
> take care of all this ?
>

I think technically yes, but that would have to be a per-cpu patchable
location, which would mean something like each CPU having its own copy of
that text page... Unless there's some existing way to statically optimize

  if (cpumask_test_cpu(smp_processor_id(), mask))

where @mask is a boot-time constant (i.e. the nohz_full mask).

> Thanks.
>
> --
> Frederic Weisbecker
> SUSE Labs

