Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B793E8C11
	for <loongarch@lists.linux.dev>; Tue, 14 Oct 2025 00:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760400098; cv=none; b=Nro6TQzOwa7Z0eior0p8S3s8PKy4egX3Qd3ckx1lurriraznxQvU9V8riOpNbKWqxcZB+aj1y4+jfFNZESoRvkLOD6j36yzP7L670Trxg13UsJJM6PMj405jtlylh/b9QaGwteppvnmfFM1SciwdSDVebhCEeVZpGPxSoUJj90U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760400098; c=relaxed/simple;
	bh=30EZppTfWymzd62I2Q/lqosIjvmCAwH24sBiTejyFlw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pN3T6EWyaPBIYoqoA7g43pODY+R7iOCq0O3ni3wLH7pHhvlH4QM2lGLg61LmFBM0OASRLS8w2FnaNAd6bMSPv13Gi+wORHB+f4z+5Ek4ixGOdPzamEYp+WnG+CioVoBaIbQyNXXyoGb2nuQieQMI9vqfowNyeu2+feWPltMtvX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f5KsZEpb; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f5KsZEpb"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-32ee4998c50so8977370a91.3
        for <loongarch@lists.linux.dev>; Mon, 13 Oct 2025 17:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760400096; x=1761004896; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=60W7dGApFCGXHKlXBRGDaLpu3YLgl4WyK3JcN6QaedU=;
        b=f5KsZEpbnKAOifgs1CySYRbLsJqgmZ7/3ux8RG9hcnj3Kri1Q//jX2kybN6RWy+tVv
         XgGSdUnvusvnq1BQnNWWiHSm8qybSiVMD7lEMlyM6+CIBeHv62+iC1cWGTkHzbMiKohY
         yVF4+ZpwMH9ks0Siqnln/Ka2ETE1JewmDVdSb1GWPCiHcCxcaAj29x8Y3OmYKmJCsEsS
         oLfTey95Kmqcp/htLUr2pV9CsR2pZ5RJHYacExiBEElCVRPq7F2n+LLBxYBR2t9ee1hp
         6E09zWwm3x6haz1JR8cno3+WUPFtX5ze6WkCwppx5hzwxbdqisSfakB1j6h7I+8wO2gv
         wIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760400096; x=1761004896;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=60W7dGApFCGXHKlXBRGDaLpu3YLgl4WyK3JcN6QaedU=;
        b=V0hoUj4+9cNmjGpClnJxNTqb6ro3b+ojlz/+WkKBm9cyfYuhGhW4rMAKW5TJiKmJrM
         cUepZvnkIK6GcDT6lgzwT9tIxqBgJttOZhVwjTS4sqiTIxx7TIgkbnTB8dWODKqu94Dx
         pGUMKWpezWXWn9G2j2MSoDLCwahzkCtBL8GbJ8o6v85MDFGZQrUfsgVBtV82Z9F58Gh5
         ILHRFWBJEs1huL50/H55D1l0FQcoqdMMyDIU/W2XrvuoVV3pw/AjO9VdoYBzU9YkAq7o
         u8SaAPYRkDH4XnfkP8hcyHUTmdJpKyVc3P/TfZkR0CFcx2xPfm1gKNIznRzHKFWeSroE
         R3yA==
X-Forwarded-Encrypted: i=1; AJvYcCU+igMGgMRktWWj2lLB0ZY/yph3X2rqBg8t4FrT+zUzqlzAHtRIw4ycCu9hGduw4rMXBhV/8h86w0E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5EBxyVMBxQJccMPb7+LPKfusqM+rQXnys3170zckCpMGWKD3G
	zNTQTvFmlJbK+46A7c/3ahEyh2gjnGxQBfOAD+E3QrnzQyhNpSwc51QKLjGaB7Ugi6dSs4KBnzq
	yWuzJUg==
X-Google-Smtp-Source: AGHT+IHFYfnmFjxjbFQp7BMqqD83h/lwfyE6WGt5bwyArJ6H0ox9P/tbWn8NIGRGgabEk9PVFSZMkd4SLvs=
X-Received: from pjbbk16.prod.google.com ([2002:a17:90b:810:b0:339:dc19:ae5d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:38d2:b0:335:2eee:19dc
 with SMTP id 98e67ed59e1d1-33b5138401amr31287086a91.28.1760400096074; Mon, 13
 Oct 2025 17:01:36 -0700 (PDT)
Date: Mon, 13 Oct 2025 17:01:34 -0700
In-Reply-To: <20251010153839.151763-20-vschneid@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251010153839.151763-1-vschneid@redhat.com> <20251010153839.151763-20-vschneid@redhat.com>
Message-ID: <aO2S3oZwOW_UgAci@google.com>
Subject: Re: [PATCH v6 19/29] KVM: VMX: Mark vmx_l1d_should flush and
 vmx_l1d_flush_cond keys as allowed in .noinstr
From: Sean Christopherson <seanjc@google.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org, 
	x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
	Frederic Weisbecker <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Han Shen <shenhan@google.com>, Rik van Riel <riel@surriel.com>, Jann Horn <jannh@google.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, 
	Yair Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, 
	Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Oct 10, 2025, Valentin Schneider wrote:
> Later commits will cause objtool to warn about static keys being used in
> .noinstr sections in order to safely defer instruction patching IPIs
> targeted at NOHZ_FULL CPUs.
> 
> These keys are used in .noinstr code, and can be modified at runtime
> (/proc/kernel/vmx* write). However it is not expected that they will be
> flipped during latency-sensitive operations, and thus shouldn't be a source
> of interference wrt the text patching IPI.
>
> Mark it to let objtool know not to warn about it.

Can you elaborate in the changelog on what will happen if the key is toggle?
IIUC, smp_text_poke_batch_finish() will force IPIs if noinstr code is being
patched.  Even just a small footnote like this:

  Note, smp_text_poke_batch_finish() never defers IPIs if noinstr code is
  being patched, i.e. this is purely about silencing objtool warnings.

to make it clear that there's no bug/race being introduced.

> Reported-by: Josh Poimboeuf <jpoimboe@kernel.org>
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> ---
>  arch/x86/kvm/vmx/vmx.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index aa157fe5b7b31..dce2bd7375ec8 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -204,8 +204,15 @@ module_param(pt_mode, int, S_IRUGO);
>  
>  struct x86_pmu_lbr __ro_after_init vmx_lbr_caps;
>  
> -static DEFINE_STATIC_KEY_FALSE(vmx_l1d_should_flush);
> -static DEFINE_STATIC_KEY_FALSE(vmx_l1d_flush_cond);
> +/*
> + * Both of these static keys end up being used in .noinstr sections, however
> + * they are only modified:
> + * - at init
> + * - from a /proc/kernel/vmx* write
> + * thus during latency-sensitive operations they should remain stable.
> + */
> +static DEFINE_STATIC_KEY_FALSE_NOINSTR(vmx_l1d_should_flush);
> +static DEFINE_STATIC_KEY_FALSE_NOINSTR(vmx_l1d_flush_cond);
>  static DEFINE_MUTEX(vmx_l1d_flush_mutex);
>  
>  /* Storage for pre module init parameter parsing */
> -- 
> 2.51.0
> 
