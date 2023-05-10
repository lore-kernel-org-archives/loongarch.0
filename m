Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6646720B42
	for <loongarch@lists.linux.dev>; Wed, 10 May 2023 13:43:29 +0000 (UTC)
Date: Wed, 10 May 2023 15:43:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683726202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NQciRSGKu3CpEpEOItv2J2B2egVEp+o8R6SOKr+6u3M=;
	b=D4jYstQQCw5CHCX1vuaurDYoezXSf7Ap0xjmBX/g+weqI3B5nWfSsWYp9FqKZBjMtYNpMu
	PGLA8wTK0wXWG9Nme5X3eLqeQij8/VaK5spqu3LPf7B/2ji7NS3GPQ/C8PWOALV1yaqdQ4
	b67fY48HtekEj8fvZa7cxMqcPhVeyGjpseFgK4ckAauZ7xsaSwIjkWl1oewhGlOx6oFb1L
	OsxwKFWTupe+SAt2ax3GuRxOKJJT0WqGq9cS3rQq2iYhaMvd9xHPHcVGkA5vS7MdqGiOwF
	WaKyD1Mp1xmJSOmp/Jmic2P4G9S7vjiXPSonfux037q5sn+31Wucu6ZbMHNizA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683726202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NQciRSGKu3CpEpEOItv2J2B2egVEp+o8R6SOKr+6u3M=;
	b=U9Te/SCktc7jgMh7oqKS+mV9MZMk18GChWdhQTZlvutbdlrgmh8jGGv5LnpP/KvqRA38iO
	L16mlF6IXYecbeAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mark.rutland@arm.com, maz@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, pbonzini@redhat.com,
	wanpengli@tencent.com, vkuznets@redhat.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, jgross@suse.com,
	boris.ostrovsky@oracle.com, daniel.lezcano@linaro.org,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, rafael@kernel.org, longman@redhat.com,
	boqun.feng@gmail.com, pmladek@suse.com, senozhatsky@chromium.org,
	rostedt@goodmis.org, john.ogness@linutronix.de,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, jstultz@google.com,
	sboyd@kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org,
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [RFC][PATCH 0/9] local_clock() vs noinstr
Message-ID: <20230510134319.qzNQqC-s@linutronix.de>
References: <20230508211951.901961964@infradead.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230508211951.901961964@infradead.org>

On 2023-05-08 23:19:51 [+0200], Peter Zijlstra wrote:
> Hi all!
Hi Peter,

> Compile tested only on x86_64/s390/arm64 -- I've just fed it to the
Thanks, this works.

Sebastian
