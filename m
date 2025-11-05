Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9721320A00
	for <loongarch@lists.linux.dev>; Wed,  5 Nov 2025 16:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762359878; cv=none; b=KjGI/RZXUYc/d3bF6hGy2Zdl0czMbUZeKZNVMdyoGHD43ZPURDliz1KZ31pLGbw1PYcvRVukzdzhNguoN3MXLc49g71n4fmVfEfvWWrEqkkCso0qO/+HopzRnngS2nAlOXarpyvVOQfsPzUlrAq+KPMB9vzZvuqDsaphWhHlk5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762359878; c=relaxed/simple;
	bh=z2Ddo9KGHO2cRfukz3n2HSveP3TR5UuZXIcomOdpHeQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FQsmMPLZ2oc/HzItHzjQioytp1C5WOXPh8bihe/hEifkdG4TGI5nbnBfz0R9c/EfuVfU+cvWbazJaXqSCCBljBrIiPfmxVnDSeZtnE2yEAPquaAsYMEYtt0MLwiC/7Jpt1Xru2s4yGkncBKiPSkUmliH+uLXF7B8rNQqfz5hpuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mjodf7t2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mjodf7t2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762359876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3pRDkw3OiFwhnb76GBtLAGbxTsylSIgAC6rXytdCdKE=;
	b=Mjodf7t2o7jJO1Ys2SsyIEOq7w47WEVUh7jtSZNCQ/cypa66PSHMh174T9rj9XiUoz+4Hf
	jKi7xTxZchaKvhWJmDcWZvdd/Mymt3yFLjCDOJSzMGeYW9dVzfPeUcNTCEebIyCHdkZraG
	4I6xJo3MTyT8Js+ogH/nyx9gb2CtI7w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-v6Tv_xNfNE-EHGiXMTlEpA-1; Wed, 05 Nov 2025 11:24:34 -0500
X-MC-Unique: v6Tv_xNfNE-EHGiXMTlEpA-1
X-Mimecast-MFC-AGG-ID: v6Tv_xNfNE-EHGiXMTlEpA_1762359873
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47113538d8cso38674925e9.1
        for <loongarch@lists.linux.dev>; Wed, 05 Nov 2025 08:24:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762359873; x=1762964673;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPk6YcBuruLXQ/o+Uci3gsoXIOQlnGdWukNwLQbwsoc=;
        b=L0hSgYwA1nKD0idnQOFv1WyNjjGTFqYm0kzKWVfVsU1kgEUDXJvFBkd4AF3VOXuFn7
         oGkUFsG+wJyFqiAsaBPtIKLV7145oLqbNL8gxDC2+sQ/tj9Bodjd0NIaLOmk/fBwORqU
         9QQRa+/MgLZYHanyzdGNGrVKavy13jqD+OEOUg9RxXt8YUCJhTJ8nKXvRDHvQtR/z603
         55jy05G/Fke63pN30jM+WeIruL1bl/NOtBjTwG4Y+5RPNdrJNAUZVLl+6XscMf7CgHzJ
         P977JG2cI9RbmWd5wZpFOqc6JvbCLLghBAmbAxV9TWK531B/RNz2OSfJ8SE9ISBlL7BM
         xUlA==
X-Forwarded-Encrypted: i=1; AJvYcCUi2JoWuNOfGV7pKnraThVfhbo5yt62P3M8ceF8AJftBaIG3V4Idga6jwXvApMUEAHwuCq/PE3Pagw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMuUx7gaYQoNyUafUa8uSnz6Z53M55weY+p3Xd4Nbr9zJmQV8R
	DXhU6YefodqsHnE5tCHyR50/zU2Sd/ctthdFxCoGosffY6V4RDgJWzZxvbA7a/qi6ng6XhNEWZz
	dQWOs7hJ62L+v/ECLzio4vCl0HRz3EBwtnp/Q1+ewgsoncCecqV4Z7ECaDVyA/A==
X-Gm-Gg: ASbGncsA7eGdxKbRh01BoYijDnRRa7d4qZq4MdRYGTh9BOXEed1cj+4gOi4JbOqJiTm
	OM1LKw30Bvg62pFDYA9QK6Xg1T8iwuQQmLtY0asdm7LI3GsO30v+awdxEjDm3UWDwI3VEfw5RnA
	zwKCwKQpSpT2ACRmDQiv9NS92/jdr+I9z4rM5u4kn2bc8FA1mFLWiGCPTgSyByZ35TFlvfvbnSS
	8wu9i/aeYQem9xUw/lFX8AUqUBdDBsIOCU89z4whK0z2A3aBWVcz2+fWf9G/goV5Rtqtgj2A4Bc
	dZBweyWP+HGYncT8BZGLcGIlFPhLBhnJzKVD6lmUIUtBg7/FDzFvPFHGjhwmVcs2GvncFrCSOWe
	T6NdK3jUplxvFtM5IilGnRtqZnd+RTNtDZ2UkHaWzAgZjGMAqe7LoQL2oiK9S
X-Received: by 2002:a05:6000:2907:b0:429:d4c2:cadb with SMTP id ffacd0b85a97d-429e3311ac6mr3563203f8f.58.1762359873180;
        Wed, 05 Nov 2025 08:24:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEL75fsQ0H2l1YahgWByyszuFW6670iMBa0il80FwPsU0pgmLcV2khMdpXTiSamLH801kgv9g==
X-Received: by 2002:a05:6000:2907:b0:429:d4c2:cadb with SMTP id ffacd0b85a97d-429e3311ac6mr3563132f8f.58.1762359872637;
        Wed, 05 Nov 2025 08:24:32 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1fd2a7sm11003113f8f.39.2025.11.05.08.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:24:31 -0800 (PST)
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
In-Reply-To: <aQJLpSYz3jdazzdb@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <aQDuY3rgOK-L8D04@localhost.localdomain>
 <xhsmhzf9aov51.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <aQJLpSYz3jdazzdb@localhost.localdomain>
Date: Wed, 05 Nov 2025 17:24:29 +0100
Message-ID: <xhsmh8qgk5txe.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kHZFbzRQCv2lWJsPJhNyDu1M5yco1ou2pgae0qbWLZs_1762359873
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 29/10/25 18:15, Frederic Weisbecker wrote:
> Le Wed, Oct 29, 2025 at 11:32:58AM +0100, Valentin Schneider a =C3=A9crit=
 :
>> I need to have a think about that one; one pain point I see is the conte=
xt
>> tracking work has to be NMI safe since e.g. an NMI can take us out of
>> userspace. Another is that NOHZ-full CPUs need to be special cased in th=
e
>> stop machine queueing / completion.
>>
>> /me goes fetch a new notebook
>
> Something like the below (untested) ?
>

Some minor nits below but otherwise that looks promising.

One problem I'm having however is reasoning about the danger zone; what
forbidden actions could a NO_HZ_FULL CPU take when entering the kernel
while take_cpu_down() is happening?

I'm actually not familiar with why we actually use stop_machine() for CPU
hotplug; I see things like CPUHP_AP_SMPCFD_DYING::smpcfd_dying_cpu() or
CPUHP_AP_TICK_DYING::tick_cpu_dying() expect other CPUs to be patiently
spinning in multi_cpu_stop(), and I *think* nothing in the entry code up to
context_tracking entry would disrupt that, but it's not a small thing to
reason about.

AFAICT we need to reason about every .teardown callback from
CPUHP_TEARDOWN_CPU to CPUHP_AP_OFFLINE and their explicit & implicit
dependencies on other CPUs being STOP'd.

> @@ -176,6 +177,68 @@ struct multi_stop_data {
>       atomic_t=09=09thread_ack;
>  };
>
> +static DEFINE_PER_CPU(int, stop_machine_poll);
> +
> +void stop_machine_poll_wait(void)

That needs to be noinstr, and AFAICT there's no problem with doing just tha=
t.

> +{
> +=09int *poll =3D this_cpu_ptr(&stop_machine_poll);
> +
> +=09while (*poll)
> +=09=09cpu_relax();
> +=09/* Enforce the work in stop machine to be visible */
> +=09smp_mb();
> +}
> +
> +static void stop_machine_poll_start(struct multi_stop_data *msdata)
> +{
> +=09int cpu;
> +
> +=09if (housekeeping_enabled(HK_TYPE_KERNEL_NOISE))

I think that wants a negation

> +=09=09return;
> +
> +=09/* Random target can't be known in advance */
> +=09if (!msdata->active_cpus)
> +=09=09return;

