Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABA729AAE3
	for <loongarch@lists.linux.dev>; Fri, 31 Oct 2025 09:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761904544; cv=none; b=NpjDESxxJOgPN4k7N5IppS4Pd8gOkMc3qusE5+HwAYappc7nKdrCaxVjg7ubZVYsObaKN0uMX7IvuboHBI898jxAVfJnnCiy10CAKkd1Cuuz1czAKnGNhDZL2ADrXVlH6famTpjfo7xyeadnVUJknPlue34loGmT5F5z0Ow/QnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761904544; c=relaxed/simple;
	bh=3tkSelHNNZtYzi5EY8XsAlaXp+ewc844ITqqtJnf0nc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YKr11BKy7wxwHGoTba0sMEgeBoe/7fMQSmYJSykhKbM5HDEkj1Gri2XLKLucquS0o5nn/0FINRstr5+PJ7bUkzb4cIi8hC0CIDcjN0m1/VnV4x9FASeRhkVrm8KbTPhqtdC+0ZYJRjcDgvXcS852TyTmVm0TOWtwrJTuN+urSIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CeugEqmC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CeugEqmC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761904542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3tkSelHNNZtYzi5EY8XsAlaXp+ewc844ITqqtJnf0nc=;
	b=CeugEqmChg06nf8lEYpsg4xGenJPg5zkuVRjpnaaVxUULE4dpEO14f0dplP+ecVeaaPtrg
	8jsA20yRqcs7GqQYgH88gVxL3ztMaQLuuX1N9fawcsK1HQ2eNG+6WeSaXEekcAVCMXdGXx
	S38+nqYv36CyU64TF1FlGwe5utQ/pCM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-M7JxCI6PMmiPrLQDgh9-qQ-1; Fri, 31 Oct 2025 05:55:40 -0400
X-MC-Unique: M7JxCI6PMmiPrLQDgh9-qQ-1
X-Mimecast-MFC-AGG-ID: M7JxCI6PMmiPrLQDgh9-qQ_1761904539
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-429a7f1ed1bso933026f8f.1
        for <loongarch@lists.linux.dev>; Fri, 31 Oct 2025 02:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761904539; x=1762509339;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTCg+N3NYwBLqF+pIITZOoHrF01dYEOCOu0+H1nRDT0=;
        b=ufzgNkobT146zO6eBl5lUQX+3TTB79SPCmS+CsAZRD9bFrlTwBvxW0v5PmsMp0VBxi
         DsQYa5epDm/KhrgcSyeHxOM7OxrC6ZxCPNCD5f8qiTzjcEdypL7M8dtXzrfA8FdAGrv9
         ekp4T7THIU1W1SR5LtKaaxd7YCvFe3utnt4SagyPwxGE2xP2FbK04MKuj3g6Oo778fQ3
         7EHhdbo2YBqsT8hEA5FszC0D9YMdf/Q4ZWJ98Bo9kkWHaYtzqp5Q3j95h1G1Wex3iCqx
         z6t/cLr9MUv70ynY+5IzYqZGLCdho8VeQLRlAIqJICMsEJX5XUJPKsl1MysWs4LP/WcN
         tQPg==
X-Forwarded-Encrypted: i=1; AJvYcCUd0V/HAG3kbH+7LsO3RcXn9Jaijc/r8PTFqPJngDy8ywe5BfIrlVwrhpQVezNHNUBxSq1ZglywTtE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyB38uepJ3fhI9FPfXzAglwIv8+P23CBDNqH6T4Ith8CzzD4B1r
	mF/VO5bk2YsdUFQ4zwqr2xteInpuUeQBznJlLjk8v7tCzvvEcHtMt4aFt3JfZLRCyLUuHmXyhbt
	dsSAQaK+bhlVhYRH9VRpt6MdmaAaWahU5hWG2StX25PG+gEmZXKVxzLA63GwZKQ==
X-Gm-Gg: ASbGncvkacNWwkqRGztBJs+kHM982BrV5sK8tzCaM3F5imZZjHKFlDQTJY8621j+Uy+
	TuH7gTOEb8XFDnMdr25vA1psnih1nvRavrhha/6sR5N43QxjL22mDSIg9cyxTS6X47VbyTojSyE
	LY8ho1xK0LGOZINJiD7UleK67GyuiO5MSNBZC+LSmVZMRK/HWnkt+uAPsdbIR4gh91/yIqTK6hR
	DsOvhr2mpm/Tywt34FP1cefAKuBcQm4APQ0GjQ3qVmF7IckTfHYPSf0gRak9kGbZDAHgknzZ+0P
	zSIU/+ysbg/WOYbOrjjG+bjHDYtQMJuYBqIVYy2vzbxf0iB6HTNLShGCm44DJ/C/F1/uBQJsQ5a
	pbN2XPq1Pfq7Na8I+fVmAa1vzeA0o6DY5tBKGCvYWHUwNU3SVwr8XFBcKXCTi
X-Received: by 2002:a05:6000:310f:b0:40f:5eb7:f24a with SMTP id ffacd0b85a97d-429bd68869amr2437844f8f.12.1761904539533;
        Fri, 31 Oct 2025 02:55:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbUxApmJAOYlrcJigfNqaTRZ7Pz52J94NiUAhMgZ/Qwj+7BmCVMNCnPqwOLJ11D9kpjdgFWQ==
X-Received: by 2002:a05:6000:310f:b0:40f:5eb7:f24a with SMTP id ffacd0b85a97d-429bd68869amr2437793f8f.12.1761904539055;
        Fri, 31 Oct 2025 02:55:39 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c1406a45sm2624895f8f.47.2025.10.31.02.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 02:55:38 -0700 (PDT)
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
In-Reply-To: <aQIpXyX-z8ltB1i5@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-28-vschneid@redhat.com>
 <aQDoVAs5UZwQo-ds@localhost.localdomain>
 <xhsmh3472qah4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <aQHtBudA4aw4a3gT@localhost.localdomain>
 <xhsmhwm4dpzh4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <aQIpXyX-z8ltB1i5@localhost.localdomain>
Date: Fri, 31 Oct 2025 10:55:36 +0100
Message-ID: <xhsmhtszfpf8n.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tzPIlMOVmRyBXOwy3Nt8PS4RuK1snG5rMjVuVw24Nqo_1761904539
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 29/10/25 15:49, Frederic Weisbecker wrote:
> Le Wed, Oct 29, 2025 at 03:13:59PM +0100, Valentin Schneider a =C3=A9crit=
 :
>> Given we have ALTERNATIVE's in there I assume something like a
>> boot-time-driven static key could do, but I haven't found out yet if and
>> how that can be shoved in an ASM file.
>
> Right, I thought I had seen static keys in ASM already but I can't find i=
t
> anymore. arch/x86/include/asm/jump_label.h is full of reusable magic
> though.
>

I got something ugly that /seems/ to work, now to spend twice the time to
clean it up :-)

> Thanks.
>
> --
> Frederic Weisbecker
> SUSE Labs

