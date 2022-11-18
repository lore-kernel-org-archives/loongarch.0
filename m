Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE42828E1
	for <loongarch@lists.linux.dev>; Fri, 18 Nov 2022 16:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668789762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iCeupirs0oRwfAYdrtKDNR33oxtw0kRHF9WhmcxURbs=;
	b=DEBF9Feea8Wzzqa57Il1PXB12mvja/P1xElzcp3dzMNg1t5HwKVEnQAxATATx12Cz84q0G
	2Xytp/PJ08cWYH+4pmjFrbK8hUYgCvko/Q6DBkv7ezvK+FRQCIQfizg6wUmQ/fFlvwW5Fc
	LUU0hSquOAszbnHw0zKHC2kxDBHY8Z0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-177-8doZE9OVPbKDvkm3ExgDcg-1; Fri, 18 Nov 2022 11:42:38 -0500
X-MC-Unique: 8doZE9OVPbKDvkm3ExgDcg-1
Received: by mail-ed1-f70.google.com with SMTP id t4-20020a056402524400b004620845ba7bso3271077edd.4
        for <loongarch@lists.linux.dev>; Fri, 18 Nov 2022 08:42:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iCeupirs0oRwfAYdrtKDNR33oxtw0kRHF9WhmcxURbs=;
        b=UGRdfw5iAntBwE5DRWgJ+An7rs+PwbJFtAg8gd2Bcqp5pRi4QyfFS5xunZG8zKiIcr
         mlpxzWCKsI+/0nJbaLWNMI/EoBMMjAn6iFZ9f/DRE5VYPWkWtkkNlg3qFji+DtJGCFxo
         CS+SmftdEg1KrTnjXsDxsZ5nEcpB/TroBWNZ6vGjlEsci0m704NxaOiQYebToW44Ytl8
         XHw3N/McJoqF9DXoEBIBOnCa6D8qyBfAQCg13wPRd5ASucPx+R6bwuJnNHwayfHE7yna
         Rd8Mka5EillBH4VKZfTTKXDpwM0RptYWbxEODpovEYPFx4WSQEOe2xx4KQPp48UHhgZM
         N91Q==
X-Gm-Message-State: ANoB5pnkrp313nJRuhsBd0qTxVi6WUBPT6VPPyEM3QlaraSzKhRnr5aL
	ODy+ogBwCyUDmAoWnsAS6Q7Uv9SVNnwAuTZXE7MtPVgHRVNKi5YR5OSs5sbpaCVMWJWmh2GJP2p
	jjWrGldeEecQJ715AK4NO
X-Received: by 2002:aa7:d4cf:0:b0:461:a9ce:5408 with SMTP id t15-20020aa7d4cf000000b00461a9ce5408mr6997405edr.201.1668789757505;
        Fri, 18 Nov 2022 08:42:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5TaV9WywAgyEkJUjIKk83rbFXBQR8khfDHnlKNNSiUU8k8aohx0CjQn5lly7hEq5+W3BWrVw==
X-Received: by 2002:aa7:d4cf:0:b0:461:a9ce:5408 with SMTP id t15-20020aa7d4cf000000b00461a9ce5408mr6997376edr.201.1668789757207;
        Fri, 18 Nov 2022 08:42:37 -0800 (PST)
Received: from [192.168.0.46] (host-95-248-159-81.retail.telecomitalia.it. [95.248.159.81])
        by smtp.gmail.com with ESMTPSA id b10-20020a1709063caa00b0073d83f80b05sm1912134ejh.94.2022.11.18.08.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 08:42:36 -0800 (PST)
Message-ID: <1ab5082c-bec5-53f2-501b-f15f7e8edbd9@redhat.com>
Date: Fri, 18 Nov 2022 17:42:34 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH v2 8/8] sched, smp: Trace smp callback causing an IPI
To: Peter Zijlstra <peterz@infradead.org>,
 Valentin Schneider <vschneid@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Juri Lelli <juri.lelli@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>,
 Nicholas Piggin <npiggin@gmail.com>, Guo Ren <guoren@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
References: <20221102182949.3119584-1-vschneid@redhat.com>
 <20221102183336.3120536-7-vschneid@redhat.com>
 <Y3ZBUMteJysc1/lA@hirez.programming.kicks-ass.net>
 <xhsmhfsehy706.mognet@vschneid.remote.csb>
 <Y3dMiyFn6TG1s5g3@hirez.programming.kicks-ass.net>
From: Daniel Bristot de Oliveira <bristot@redhat.com>
In-Reply-To: <Y3dMiyFn6TG1s5g3@hirez.programming.kicks-ass.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/18/22 10:12, Peter Zijlstra wrote:
> On Thu, Nov 17, 2022 at 02:45:29PM +0000, Valentin Schneider wrote:
> 
>>> +	if (trace_ipi_send_cpumask_enabled()) {
>>> +		call_single_data_t *csd;
>>> +		smp_call_func_t func;
>>> +
>>> +		csd = container_of(node, call_single_data_t, node.llist);
>>> +
>>> +		func = sched_ttwu_pending;
>>> +		if (CSD_TYPE(csd) != CSD_TYPE_TTWU)
>>> +			func = csd->func;
>>> +
>>> +		if (raw_smp_call_single_queue(cpu, node))
>>> +			trace_ipi_send_cpumask(cpumask_of(cpu), _RET_IP_, func);
>> So I went with the tracepoint being placed *before* the actual IPI gets
>> sent to have a somewhat sane ordering between trace_ipi_send_cpumask() and
>> e.g. trace_call_function_single_entry().
>>
>> Packaging the call_single_queue logic makes the code less horrible, but it
>> does mix up the event ordering...
> Keeps em sharp ;-)
> 

Having the trace before the IPI avoids the (non ideal) case where the trace stops because of
an IPI execution before we have trace about who sent it... :-(.

-- Daniel

