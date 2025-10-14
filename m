Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181AD8C11
	for <loongarch@lists.linux.dev>; Tue, 14 Oct 2025 00:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760400172; cv=none; b=GWRJqoDGSKRE+8qAu0ddGVpg0oJsK58RLZ8B0cwQf9zXjDSXi+F2ZoluqtHIR64S8HyeiSV1qCu3KX/672ChLLaLwD7qZV5cLGanFmHv08TQ7At9t6XlO6+vXNd+XJ39v7rmXJwr38ngugeqDaD0mbZLkEdttFuSW22MLUN8qC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760400172; c=relaxed/simple;
	bh=LLOVlwAfJOO/6dIvSHatLzz1DYqRKk528EsxcLVUzvg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JFJkCsfoFuZ8xF5MTdBtF7HIu08y+PbPap2DXH9DBQp0wk47teSdIwbKZmOcEuewRc2JfKz6v5jtKDdQ2AnHrh5eQkh83/WHf3p54YNLtcJOYGniPUV0GHzsiJg9Vmtqjbr7eUnGOI44hytC+QTX+Qtrbqr4oszkx+XcJMj7IsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lz9duTdV; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lz9duTdV"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-334b0876195so10678256a91.1
        for <loongarch@lists.linux.dev>; Mon, 13 Oct 2025 17:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760400170; x=1761004970; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gbMLU0DBTTE4ZUI3tpJtNUcx/FkgYHD5aLH5yKQ0ecU=;
        b=Lz9duTdVge4dEeqpg92gYbVNG9x5qU1gEWrNHCYAi/DOg4MO5CF4FySoA1gQUKScoS
         JdLi8RmqzzpTu6qXLueew3IDt8Ela/+NtbiwlGk4o94FNwX+1ICBZi04iVXQ6xfuU3T8
         p2Gd1hGxBMLr1xUsrC94jiiQ20doKroGxAo9tOf6o9nDI3tGVF8Nc9gq6NCiI2vkt13h
         zUOiSDzmYTvSvQUu25Q1wXdZ0RvROvPpthE7jT0qwOKz3PmBJCC4c7EhVbBKHse5kxJJ
         vIDxk45ZLorILP/QxnUBPS8QD6YX1sSZdSGLkIa4KzcPZG1QkW/ri5VX9XkDuPVNCs5T
         YRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760400170; x=1761004970;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gbMLU0DBTTE4ZUI3tpJtNUcx/FkgYHD5aLH5yKQ0ecU=;
        b=UP1qnJ0r6z49zHPsgn3+EVD15fqtmtPeFI2v1E+exas9ZlXDqlv5Xs+S02shLeNFdG
         0hBj0Hax9bI4cDVKoKmjp9Oo+KN4fB8WGwiEE2fAYIXxhrTSZLZTTtmzDqdsmcr/DoAo
         0LakEWirtklgUdKSnY+SQVKly6se4fGfFEq7/TEPW2J9vcr7U7ECO0q8RFgOzdv4GS5W
         NZn4giqw6aFlNUFXXf7VyImWOii9GmOO6bAawuAd4CcqsQAFl51b3a1mnJPdgGiTpCKd
         qHoPJkVUNHG048ZkuCCD7B2YBQvgH8vT88qKvnjVs49YltfRWAsA/Wq83sAsBeD+yC/T
         4bHw==
X-Forwarded-Encrypted: i=1; AJvYcCUzMvdmkJiTQVBauWuk5y+aYf1DOXCV6Ymr++HtlBBQTCPdFLVfcL+S6pAkR5tfIOh8bGpLw7lDGs4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw85yHr4uLqn7nNmH9TaZ9LPR1xPR9w41pRlFvI3U6Zfo1uG1Ld
	iifyTzFjlMzwcrmNmV/UbxXsz3LxtyJWyg8u0Xsto4af9DG3k6f2+tJ+q1KMHQuhPXEpO+9fX8t
	aTM7r5Q==
X-Google-Smtp-Source: AGHT+IFj7XEk3dTkPnLos5082VprjEOkbmDHEla6HA+8/jfX0ozELV9F0rEtoGCDSVNCkEzGlN6/hN7WXyk=
X-Received: from pjzm8.prod.google.com ([2002:a17:90b:688:b0:33b:51fe:1a75])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c89:b0:321:9366:5865
 with SMTP id 98e67ed59e1d1-33b513b4afemr31472790a91.33.1760400170137; Mon, 13
 Oct 2025 17:02:50 -0700 (PDT)
Date: Mon, 13 Oct 2025 17:02:48 -0700
In-Reply-To: <20251010153839.151763-17-vschneid@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251010153839.151763-1-vschneid@redhat.com> <20251010153839.151763-17-vschneid@redhat.com>
Message-ID: <aO2TKOY5JV9OoRUg@google.com>
Subject: Re: [PATCH v6 16/29] KVM: VMX: Mark __kvm_is_using_evmcs static key
 as __ro_after_init
From: Sean Christopherson <seanjc@google.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org, 
	x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
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
> The static key is only ever enabled in
> 
>   __init hv_init_evmcs()
> 
> so mark it appropriately as __ro_after_init.
> 
> Reported-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> ---

Acked-by: Sean Christopherson <seanjc@google.com>

Holler if you want me to grab this for 6.19.  I assume the plan is to try and
take the whole series through tip?
