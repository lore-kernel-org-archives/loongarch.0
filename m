Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144F743F08F
	for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 12:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787228504; cv=none; b=tPqLk5PmALZMbtVmsNh7kPh9WP0P4jfclPCMgIAuNW4hr/deL75xHd2Cnv+U4eLeUtti6XTTRCNMS1fWHZ5VJTpVZHpP4qQsjVzf4DR1glAOxcfDf8pafwn1Kv5WRPvngm6ttFVigrQOWEJ1VVChE0INle6XEBt32boRt2ApaUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787228504; c=relaxed/simple;
	bh=GJ+FiKn4NP3zM/ImLgxIRtQppWGJ35OqRyfVtv4PO3U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mhGKu3hiG4ZfcCP5tLKjMJIsnSPPHVmFKmSVl4EqE9AfXYNvR3p7a4dK91tthhJjdMHaWZArXPuTbQuCpz1G7U68Y416nvsUMTpBI5GE7SDlxfw//u72kinRuyfEZ4ZX5lcCAmmho6YJx5qRhQxWD+YMoJq2kb42eDu9uQQlZQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Up3V1IpI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Up3V1IpI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787228502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNk7Cd7avSLwD5U7YbcUtZCLln2gfmogkmv7E85mGj8=;
	b=Up3V1IpIoUxgbjvJJOV2/99m+QHWRrVO9kKEhvX+LVZZXNLGInaP31LSP9N9b78YirzJSf
	JJ6v/K0I1kSh2Ibn2Q2MzFwh7Pnp7+lfWYjObp7WfR6o8YVujyh/lEnqfsF8NNOmhT+xmO
	V4J4YxHOGfF8kZ6OpA6pZ70uUqxoAwY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-35-1NbTOSR6MKevFigPeVGjpQ-1; Thu,
 20 Aug 2026 08:21:32 -0400
X-MC-Unique: 1NbTOSR6MKevFigPeVGjpQ-1
X-Mimecast-MFC-AGG-ID: 1NbTOSR6MKevFigPeVGjpQ_1787228489
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2C39D1800471;
	Thu, 20 Aug 2026 12:21:27 +0000 (UTC)
Received: from rotkaeppchen (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 185991955F03;
	Thu, 20 Aug 2026 12:21:19 +0000 (UTC)
Date: Thu, 20 Aug 2026 14:21:14 +0200
From: Philipp Rudo <prudo@redhat.com>
To: Mukesh Pilaniya <mpilaniy@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton
 <akpm@linux-foundation.org>, Baoquan He <baoquan.he@linux.dev>, Mike
 Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>, Tao Liu <ltao@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org
Subject: Re: [PATCH v2 2/2] kexec: fix error propagation in
 kexec_image_probe_default()
Message-ID: <20260820142114.0a36ac78@rotkaeppchen>
In-Reply-To: <20260819-mpilaniy-v2-2-95e929ede0e5@redhat.com>
References: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
	<20260819-mpilaniy-v2-2-95e929ede0e5@redhat.com>
Organization: Red Hat inc.
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: a2XhlEHKCASXeuzDO6pOFGzuwulz-sDVw3HxusWovuI_1787228489
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Mukesh,
Hi Pratyush,

having this patch makes sense. Personally I'd go with having a
switch-case rather than individual if-blocks. E.g.

	switch (ret) {
		case 0:
			image->fops = *fops;
			return 0;
		case -ENOEXEC:
			continue;
		default:
			return ret;
	}

IMHO that is better readable and easier to extend in case other error
codes need special handling as well. But that is only my personal
opinion.

Independent on which implementation you use.

Reviewed-by: Philipp Rudo <prudo@redhat.com>


On Wed, 19 Aug 2026 23:17:23 +0530
Mukesh Pilaniya <mpilaniy@redhat.com> wrote:

> kexec_image_probe_default() overwrites ret with each loader's probe
> return value and returns whatever the last loader returned when no
> probe matches.  The error code reaching userspace depends on whichever
> loader happens to be last in kexec_file_loaders[].
> 
> Only continue to the next loader when a probe returns -ENOEXEC.
> Propagate any other error such as -ENOMEM immediately. Return -ENOEXEC
> only when all loaders have been tried and none matched.
> 
> Suggested-by: Pratyush Yadav <pratyush@kernel.org>
> Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
> ---
>  kernel/kexec_file.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index 59fb9d71e9d8..b3060e984ef3 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -68,17 +68,19 @@ int kexec_image_probe_default(struct kimage *image, void *buf,
>  			      unsigned long buf_len)
>  {
>  	const struct kexec_file_ops * const *fops;
> -	int ret = -ENOEXEC;
>  
>  	for (fops = &kexec_file_loaders[0]; *fops && (*fops)->probe; ++fops) {
> -		ret = (*fops)->probe(buf, buf_len);
> -		if (!ret) {
> +		int ret = (*fops)->probe(buf, buf_len);
> +
> +		if (ret == 0) {
>  			image->fops = *fops;
> -			return ret;
> +			return 0;
>  		}
> +		if (ret != -ENOEXEC)
> +			return ret;
>  	}
>  
> -	return ret;
> +	return -ENOEXEC;
>  }
>  
>  static void *kexec_image_load_default(struct kimage *image)
> 

