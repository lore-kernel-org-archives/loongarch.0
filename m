Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632291ADC72
	for <loongarch@lists.linux.dev>; Tue, 14 Jan 2025 21:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736889567; cv=none; b=edcsO/9YdNBI5iYvlKMzlMohz91/mkFYN7iM0X3RLGnTPrmFA9fKGNxw2D6l6Ws2Bf/Ecl61Lglph08Jcl4fTgxc8CCQdvtAlya1mwcKNCAZEdAGX6YqcSNOokh4c2wyqjokdVJWd9knirs1vUCMVERE2HXZ5XrMnYGuNxFITig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736889567; c=relaxed/simple;
	bh=75fcOSQJdhmnq3pSXnEyg1Dd9Gtm+vOQTHqw0XM6WTs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W+CU1kz6Qn8mAoBvC37d9skvG208GjSu8gH2irtaRzUds87qnXjJSXgaKiPVpk674/dELQ6eKRAk78p+D6Qi1UaidMU/hWetrTCjnQj9/426HArdrMbWkS4jjlcPzN6ip6QH/Lmyg1PJZJA+EvF/rdR1XkQ0vRcVk2lkUs6saj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bc84e90y; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bc84e90y"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2163dc0f689so154237025ad.1
        for <loongarch@lists.linux.dev>; Tue, 14 Jan 2025 13:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736889565; x=1737494365; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XVbipT56M6kECF5Qh7elLUxboyXWurLrq3UYAkefsoQ=;
        b=bc84e90yeVo9w1vxacI6t5zDYPJTYA2UD81hCul4BEno0TH20YeQsT+PJ5AdrZ3q++
         6mBDkscVO6MSUW9zNclAIhQqaV7AwU+sqrlMeRFl/vt90DO7ZWL3IesfrvmSdHnnNJdH
         agBf3Dgrvg4eBscxAvUZ0Tz2fJZtzrZzET8C7o/qtFzaqY9hbvk09g2oltihhZZTxq7a
         yBegR/CBuSwylOwUpGU+jkhP/A5gfO9LiXEehptJkdiwiSMq3boK6BXtCXBaNdxOKP4l
         SI+K4Z/foHCAAZdTwyd5NICnlirk2LflEmnNcr/LUZmAeupbOYC33zebejqxnRlXKDbI
         NNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736889565; x=1737494365;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XVbipT56M6kECF5Qh7elLUxboyXWurLrq3UYAkefsoQ=;
        b=tcl/k3++g42rH1gjT87zKtCupTgL84K2mpfiw1SpMGMRDN5yuiVS6Ix0x7kxmkUWAX
         7Em8V4nGf5KMH3X4b015T2NqQh5mPC2yEb8xDGMSJczlGI4Y59c6jlt1bvzWnJP3OMLB
         lga3YmF7j/1t7G9UM1b3TH87H1g9ek/GPxXOfOXjytowbWv2Et6SFNdY7apqDxHmCTk2
         0x5mk6Akm89oisvuOcHSnZb9pjlFaDsRQUJ59NFJV2KO74T48FKuMMyZg95Hk7sEVmfc
         hvn0NIfXfq0FjP2IhY3aSj3H0QzrAi/B5ntwPaK5FF7WL7GNqLAPTPuA02O80oeSuzAo
         tp7g==
X-Forwarded-Encrypted: i=1; AJvYcCX8gY4s1YNJ1Hhxg9H1TP1mX4wu7r1sRlCnJRA1d+gKTy2EQmyOGH9wiFC1BGm2Xgx6ouoVJcaryMY=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr9cS6djASJsVs3wmsYzt75U+9+5niue32XnkzfUlk4Qby/xeC
	BNMh/WxEVq5Gqe54L7tpVa+KEj03ZR7JoM+mU4Y/LAAMpm3GA32iK0AZQ4tqZkteHd74XtypeD6
	xAg==
X-Google-Smtp-Source: AGHT+IGTMIc2Hr+w/ebVVGGlbFAB7WFV7TbQJLIjfH34Jlhrw+YYPMlrag1B602JmLWOQ4sU4fLE9W3Pz50=
X-Received: from plap13.prod.google.com ([2002:a17:902:f08d:b0:217:8109:e87])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cec1:b0:216:3dc5:1230
 with SMTP id d9443c01a7336-21a83ffc1dbmr401799985ad.42.1736889564696; Tue, 14
 Jan 2025 13:19:24 -0800 (PST)
Date: Tue, 14 Jan 2025 13:19:23 -0800
In-Reply-To: <20250114175143.81438-19-vschneid@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250114175143.81438-1-vschneid@redhat.com> <20250114175143.81438-19-vschneid@redhat.com>
Message-ID: <Z4bU2xlZXh53lgH6@google.com>
Subject: Re: [PATCH v4 18/30] x86/kvm/vmx: Mark vmx_l1d_should flush and
 vmx_l1d_flush_cond keys as allowed in .noinstr
From: Sean Christopherson <seanjc@google.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Frederic Weisbecker <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang1211@gmail.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Clark Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>, 
	Tomas Glozar <tglozar@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, 
	Mel Gorman <mgorman@suse.de>, Kees Cook <kees@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Rong Xu <xur@google.com>, 
	Nicolas Saenz Julienne <nsaenzju@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Yosry Ahmed <yosryahmed@google.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="us-ascii"

Please use "KVM: VMX:" for the scope.

On Tue, Jan 14, 2025, Valentin Schneider wrote:
> Later commits will cause objtool to warn about static keys being used in
> .noinstr sections in order to safely defer instruction patching IPIs
> targeted at NOHZ_FULL CPUs.
> 
> These keys are used in .noinstr code, and can be modified at runtime
> (/proc/kernel/vmx* write). However it is not expected that they will be
> flipped during latency-sensitive operations, and thus shouldn't be a source
> of interference wrt the text patching IPI.

This misses KVM's static key that's buried behind CONFIG_HYPERV=m|y.

vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x241: __kvm_is_using_evmcs: non-RO static key usage in noinstr
vmlinux.o: warning: objtool: vmx_update_host_rsp+0x13: __kvm_is_using_evmcs: non-RO static key usage in noinstr

Side topic, it's super annoying that "objtool --noinstr" only runs on vmlinux.o.
I realize objtool doesn't have the visilibity to validate cross-object calls,
but couldn't objtool validates calls and static key/branch usage so long as the
target or key/branch is defined in the same object?
