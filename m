Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBE71FBC8B
	for <loongarch@lists.linux.dev>; Tue, 14 Jan 2025 18:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736879366; cv=none; b=UiGwGB4T19PJ9AuBMnB3j8xdXo/X3eX2ETJsTtcc8OvkNOZntobAgodIfeYytVzAaXsF0ZppjpQgLQhg/f5ysDH2p23aLZ9Eu717AGWJihr/fI8xurN3DGhwa6RhRqkW1OO7uY5fmWXSgG6Oduqmd0CWALURMFrYhcUeuga4tQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736879366; c=relaxed/simple;
	bh=jsa0CovMO5ZT70pqhIrCF6Xwrs9x8fVebY2Xd/EYn6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pC+CE74wdJ2y+qagm1KqvArcQjzmZjf8DdoQ6ZqqxuEJsW8Dz5A1b6N8fDVn6TDyYEO5CxrML8ejzmouclkvbTEQNvH5I96B+g9ryr//xx8cWJyBG8t8N1LvF/QH3ehQsuSM2qSug2hAHjrryyoy6jjtSU7QwNTa1f3vqcUs+vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=LBM4cp25; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="LBM4cp25"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa6c0d1833eso429556066b.1
        for <loongarch@lists.linux.dev>; Tue, 14 Jan 2025 10:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736879362; x=1737484162; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+L6x2g4BC/d/+jfoDGOj0pMskOpzz9VGXCLG5E4WwRY=;
        b=LBM4cp25Uzu/yzyAAMtZyTKP4KNqHVIXyng34DYHYaxk174oVfL9f3kNhoOj+eHiGA
         TeJEC2Vp4qbaxQR2DocUbIk10tht8rP4H/qsTyQjhxTS0e5rE+huW+vVQ0+2DDNfqpXF
         ePBPV4xFKqo81Yx5KYFLbhIOtv3V7JRJL3L19w2+7BNAb0fQZXRXocjlh44rC7nHeAu3
         FUGogCMCX++aEoc0gRRrBEddRRV1KWESMJCpu/wZsoR+6LLSRyR3ZIArBweQJ5lUODV9
         9iCA4JO2HZspBG+oUc5ivljrtTO3jzp7gQFFtnNSRUAc0i/hrzHqGodIGJDEZQNKuD2/
         ijJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736879362; x=1737484162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+L6x2g4BC/d/+jfoDGOj0pMskOpzz9VGXCLG5E4WwRY=;
        b=wgdv3F0ZgpXHfvTSCqrMX87bAZJoti+sY0vp/xEsmAqpbz/xSvEUfz3kMuLSTSDmX1
         FhnfS7FYrQhID7WX+4M2OHeVlfa9vtXnibSPSVkvyyrCNxFJcCXSQU7TTRywPIE7hzGM
         28VKBkkCAruDkFjQHgvZ2DPWOir8eCf0W8L2IxDm2rMC0+Cpdt53TXl+xKCIoXbWjv+A
         cLSGKLgozned3sZjLUaolflhJtPuvfJ+7b4C76CUIxpX/ceLSWtdyHIe02LmnK8d4rAy
         77DOHyMsqRvh1kl/xtbAXEhRvnc9ZBtttZ2+cdxL8xS/HON45OmHM2BaouqM5WyWKYfj
         c8Vw==
X-Forwarded-Encrypted: i=1; AJvYcCULWJFtcblErYeDMhTOfcq8atwz8FT0mX+8S+PwfIG2VqbmEdFP9dFuoNyr2nOMS2Kt3tGgmS6suIc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLn5V3KMnB/fZa++XEVRWiPov3WpGSFuT5Nrh+IukIZaZ1es2a
	ERRmNTMJ8UflyEDm/qJgLJofjEmwp39L/vQIVd+71nUbf++2MmVxc5cbc0+8i5Y=
X-Gm-Gg: ASbGnculV/bklPIGBeG13rdAcHpHj9fElzx0BcL0rTzPb4NClfUHR0lYL6tOfkRsyDa
	VFMK4+5m9eefr1WZKYqQSkNlXZBt3ucPGhS6cb/UIZIHDt/nCKIA56DC2ST0g04hJLjI4SimuUj
	tV5+myUGcsVdrlNXVdJ2Fd0qQHMGoe7u9Ux0sXgQeGQk81N/1W7tM5Ij6RuIKlyQfgZRbENYSse
	EJl45HAgJvDaac+pVs7mDy75QBJ1nhp2lY3ahZZpMWqHVnG2rFevsExouzYgZWaNsIyaUVjVxSY
	HdvYmthf2TxRngvy+4/vl89xV3pR7o6Hy/fjMWPLNA==
X-Google-Smtp-Source: AGHT+IElLRyBSSFsvDLttv+1rxbirlHss1/zCBNTWvitDc/Y1ed9oUs4kNSXL7wHp3+sai4oSrFAlg==
X-Received: by 2002:a17:907:96a7:b0:aa6:2c18:aaa2 with SMTP id a640c23a62f3a-ab2ab73e7dbmr2340049566b.27.1736879362392;
        Tue, 14 Jan 2025 10:29:22 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c905f04fsm659166066b.27.2025.01.14.10.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 10:29:21 -0800 (PST)
Date: Tue, 14 Jan 2025 19:29:21 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, 
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
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Frederic Weisbecker <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang1211@gmail.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Clark Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>, 
	Tomas Glozar <tglozar@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Christoph Hellwig <hch@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Rong Xu <xur@google.com>, 
	Nicolas Saenz Julienne <nsaenzju@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Yosry Ahmed <yosryahmed@google.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 10/30] riscv/paravirt: Mark pv_steal_clock static call
 as __ro_after_init
Message-ID: <20250114-7fc0ed577ee91b6813f92806@orel>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-11-vschneid@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114175143.81438-11-vschneid@redhat.com>

On Tue, Jan 14, 2025 at 06:51:23PM +0100, Valentin Schneider wrote:
> The static call is only ever updated in:
> 
>   __init pv_time_init()
>   __init xen_time_setup_guest()
> 
> so mark it appropriately as __ro_after_init.
> 
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> ---
>  arch/riscv/kernel/paravirt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
> index fa6b0339a65de..dfe8808016fd8 100644
> --- a/arch/riscv/kernel/paravirt.c
> +++ b/arch/riscv/kernel/paravirt.c
> @@ -30,7 +30,7 @@ static u64 native_steal_clock(int cpu)
>  	return 0;
>  }
>  
> -DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
> +DEFINE_STATIC_CALL_RO(pv_steal_clock, native_steal_clock);
>  
>  static bool steal_acc = true;
>  static int __init parse_no_stealacc(char *arg)
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
