Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1363A1E7E
	for <loongarch@lists.linux.dev>; Thu, 26 Feb 2026 09:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772097888; cv=none; b=jRmrLyYsMWy7yGLq+mYyXH19QTw+16nsqoR1SUMq2yM5o0L/GSTGxZqbc97/qOgiolAk2bwIKk+mj25baJ8AJOerDv+EUbn7SJUzY0nRzpXXzO4JfKTe3M26fNZdaKqMOVG7EzR0OifVtBTgr0QXBhxMSTqO4QcsmnivfIUA6Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772097888; c=relaxed/simple;
	bh=NvU8NXH/fxvS2vxOBpwffhDKV9pJh4/6pbaFHH70J0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ZnGWK6b4p6Mh3qNNGQXAp8bpwagaBLJpwXRj+OSiIxWkY+M+CFs9aHC7ZWfzvGf9arQVAHdJRQZmsh98hjSvSUroG7eMEmnEhVF45MzB65LcJm+g+vqnPxPeGyaMTLQ8AHuni7EG14lB1swmdcrNpStvvYbuGz3cLM7pPhkmJEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BukvBJoQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BukvBJoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772097886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0f2eSr9rmaNS1+79aXS+wFuWYZUMMuO+mzVaId9UwP4=;
	b=BukvBJoQYmP+TLZSR60t3gz+cXrEseAQuSs1eHpJ2VcKm2MH94IZYui/DXineDpa9M4FGT
	KmzMfw8HW4QahVW7TMf6BXGkOgQm/+RjctKuAC1bJYNJwkcbwctV8bpbExJ7SRp8VyYPi8
	h7/dxhMJpsiqj2MUrWRiQkWEiNaeyow=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-13-X0rGY6nTMuu-QJYjQSsSnw-1; Thu,
 26 Feb 2026 04:24:42 -0500
X-MC-Unique: X0rGY6nTMuu-QJYjQSsSnw-1
X-Mimecast-MFC-AGG-ID: X0rGY6nTMuu-QJYjQSsSnw_1772097877
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D399F1956089;
	Thu, 26 Feb 2026 09:24:32 +0000 (UTC)
Received: from localhost (unknown [10.72.112.101])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BAD4B1800348;
	Thu, 26 Feb 2026 09:24:25 +0000 (UTC)
Date: Thu, 26 Feb 2026 17:24:21 +0800
From: Baoquan He <bhe@redhat.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com,
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, akpm@linux-foundation.org, vgoyal@redhat.com,
	dyoung@redhat.com, rdunlap@infradead.org, pmladek@suse.com,
	dapeng1.mi@linux.intel.com, kees@kernel.org, paulmck@kernel.org,
	lirongqing@baidu.com, arnd@arndb.de, ardb@kernel.org,
	leitao@debian.org, rppt@kernel.org, cfsworks@gmail.com,
	ryan.roberts@arm.com, sourabhjain@linux.ibm.com,
	tangyouling@kylinos.cn, eajames@linux.ibm.com,
	hbathini@linux.ibm.com, ritesh.list@gmail.com,
	songshuaishuai@tinylab.org, samuel.holland@sifive.com,
	kevin.brodsky@arm.com, vishal.moola@gmail.com,
	junhui.liu@pigmoral.tech, coxu@redhat.com, liaoyuanhong@vivo.com,
	fuqiang.wang@easystack.cn, jbohac@suse.cz, brgerst@gmail.com,
	x86@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, kexec@lists.infradead.org
Subject: Re: [PATCH v6 1/5] powerpc/crash: sort crash memory ranges before
 preparing elfcorehdr
Message-ID: <aaARRZh9k_0oG3Qo@MiWiFi-R3L-srv>
References: <20260224085342.387996-1-ruanjinjie@huawei.com>
 <20260224085342.387996-2-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260224085342.387996-2-ruanjinjie@huawei.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: Okxj8rcaEJarrhvvViFQsPGkydcoC0k5Ik9b-5wo69I_1772097877
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 02/24/26 at 04:53pm, Jinjie Ruan wrote:
> From: Sourabh Jain <sourabhjain@linux.ibm.com>
> 
> During a memory hot-remove event, the elfcorehdr is rebuilt to exclude
> the removed memory. While updating the crash memory ranges for this
> operation, the crash memory ranges array can become unsorted. This
> happens because remove_mem_range() may split a memory range into two
> parts and append the higher-address part as a separate range at the end
> of the array.
> 
> So far, no issues have been observed due to the unsorted crash memory
> ranges. However, this could lead to problems once crash memory range
> removal is handled by generic code, as introduced in the upcoming
> patches in this series.
> 
> Currently, powerpc uses a platform-specific function,
> remove_mem_range(), to exclude hot-removed memory from the crash memory
> ranges. This function performs the same task as the generic
> crash_exclude_mem_range() in crash_core.c. The generic helper also
> ensures that the crash memory ranges remain sorted. So remove the
> redundant powerpc-specific implementation and instead call
> crash_exclude_mem_range_guarded() (which internally calls
> crash_exclude_mem_range()) to exclude the hot-removed memory ranges.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>

You should add your own Signed-off-by since you sent it out.

> ---
>  arch/powerpc/include/asm/kexec_ranges.h |  4 +-
>  arch/powerpc/kexec/crash.c              |  5 +-
>  arch/powerpc/kexec/ranges.c             | 87 +------------------------
>  3 files changed, 7 insertions(+), 89 deletions(-)
......snip...

