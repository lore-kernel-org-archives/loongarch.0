Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A2C60859
	for <loongarch@lists.linux.dev>; Wed, 24 May 2023 16:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684946445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zbhz5u+O2nNXdtmS5V2mgp+v9A1AIo3AJJNjTTAhOcc=;
	b=NyRTJdivPyEZTrOUEo0u/LYJ6RXRJdXMWhS41aFCfH6n0Bzig3IVcfHsTXSob9xgBOKw6T
	Y+Qh91+1AgDzrnH+xiwOOf3eqCYMwba64l3lA5380SonZwS6KLaCYL2dGg2sR4bSllJNQE
	7jBZnGyVRaoFM67cS7OKYICsI6jNLys=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-WVGAXxJvMv6A8gIuSxEaNw-1; Wed, 24 May 2023 12:40:43 -0400
X-MC-Unique: WVGAXxJvMv6A8gIuSxEaNw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3f5fb41bc42so5114415e9.1
        for <loongarch@lists.linux.dev>; Wed, 24 May 2023 09:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684946442; x=1687538442;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zbhz5u+O2nNXdtmS5V2mgp+v9A1AIo3AJJNjTTAhOcc=;
        b=R1bzsNCLvg54/pzmZI6eIrG4bzmvWDSxo/KxNqZgNd2VRDOmXzIYttVyOF2uPBAIDB
         VwdG2G3kjMeoAyPd6Fxl1ZppP9RFXrpJmxQ8ueUbrPB1PLd4YsFIqjgmp6KOcKAj7yw6
         NuzxJGbOkO9gIn6gom5ooyiuarxLDMHRIbVWSb951S+OcQJjALKVjal7hW9kMftnYIjS
         AJshFF1oxmQHKoNsz1KRuSSMJW/0V3CGwIodoWPLGVSy3GEv5od+SCzRpcH521fpMveO
         itmEg213iAxDx+QAOAFtai1Qg25Z2s5/X194yf0CkS/6LrEnpu3gmjAtzkA6wgjKG+Yv
         SwTg==
X-Gm-Message-State: AC+VfDweJa/sWBScszCKKFmGtfzJAt99X0hh/Bh4BjBH+3mTivfB2B2n
	7g+xKJvQPyUAGDb5RlDQ8hpOrr3WbilHVhh+LObDBUfxC2cNnr+fdObMdoVGKsPu+HvKm1wxT1n
	4nQg6kTcizfsWmDRPJxxw
X-Received: by 2002:a05:600c:2111:b0:3f6:fb2:add4 with SMTP id u17-20020a05600c211100b003f60fb2add4mr244890wml.33.1684946442753;
        Wed, 24 May 2023 09:40:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6pE3yaKxCYX7zqqrKH6+W+ikC4iDSemy7egKZCbhh7dr5ElNQFIVkvnmdZL9w3/iWAnmCCqQ==
X-Received: by 2002:a05:600c:2111:b0:3f6:fb2:add4 with SMTP id u17-20020a05600c211100b003f60fb2add4mr244870wml.33.1684946442433;
        Wed, 24 May 2023 09:40:42 -0700 (PDT)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id y8-20020a7bcd88000000b003f6038faa19sm2808325wmj.19.2023.05.24.09.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 09:40:41 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>, bigeasy@linutronix.de
Cc: mark.rutland@arm.com, maz@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, pbonzini@redhat.com,
 wanpengli@tencent.com, vkuznets@redhat.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, jgross@suse.com,
 boris.ostrovsky@oracle.com, daniel.lezcano@linaro.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 rafael@kernel.org, peterz@infradead.org, longman@redhat.com,
 boqun.feng@gmail.com, pmladek@suse.com, senozhatsky@chromium.org,
 rostedt@goodmis.org, john.ogness@linutronix.de, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, bsegall@google.com,
 mgorman@suse.de, bristot@redhat.com, jstultz@google.com, sboyd@kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 03/13] arm64/io: Always inline all of
 __raw_{read,write}[bwlq]()
In-Reply-To: <20230519102715.368919762@infradead.org>
References: <20230519102058.581557770@infradead.org>
 <20230519102715.368919762@infradead.org>
Date: Wed, 24 May 2023 17:40:39 +0100
Message-ID: <xhsmhpm6pptrs.mognet@vschneid.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 19/05/23 12:21, Peter Zijlstra wrote:
> The next patch will want to use __raw_readl() from a noinstr section
> and as such that needs to be marked __always_inline to avoid the
> compiler being a silly bugger.
>
> Turns out it already is, but its siblings are not. Finish the work
> started in commit e43f1331e2ef913b ("arm64: Ask the compiler to
> __always_inline functions used by KVM at HYP") for consistenies sake.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Valentin Schneider <vschneid@redhat.com>

