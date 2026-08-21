Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EEE3CC7EC
	for <loongarch@lists.linux.dev>; Fri, 21 Aug 2026 08:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787301651; cv=none; b=uL61snGKu3JHLZtTbxpl17sghc9rNJUZ2TpfnsCIhYwBqPjmcWxx1fbzQNBN5w34yiT9p/UtdEaI7g2EZJlZGH5TtGC3eDZVZ/wlTP9XuFO2kCYRelh8fBDROiiRhhgUZb0gL58QP041nH83w/LihPT++qyyy0lseulUpVCFwlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787301651; c=relaxed/simple;
	bh=Ea6ldbioumPLbw3SRtg9uBldOrNDu/S+v4sVz75kmuM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PUmKHUsyocjvwRNb76L7bE0kwsYWiBtIGZCjzwKR4j/JkRhr1cVkwC546ieu+1R/C1wg/buAtNQU+wlw4URbA5efMxbvZ3iulEQjXnMQqX+t4eLm1CH8d/Wd5scsMVFxJS0nJWfZGdaQq6Ke8k3KHF3Gj+l1YsaqO7UbkEc1MYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Af8SXiSn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Af8SXiSn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787301648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yECaM6gMbXnP91uZ4srjkL1nmloCLEH+XRj0dZ8xS3g=;
	b=Af8SXiSnC6kuB+X0c6Uc25+AEICDl5ba+9/NnS8YGLMRk64zgtawSlBOaf0PcdvHJLGp5c
	8UL9uRCGXl286Arx9nmthvhSiTW/mNkVHipyCv9fyCX7aTvwCdj4Z8jE1yO/rK+gtXmBvS
	WY/BjDbG21Y9mScz18GkgXHlYfr2oZo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-465-a42FUQFdMxyrU_1m2nTEew-1; Fri,
 21 Aug 2026 04:40:43 -0400
X-MC-Unique: a42FUQFdMxyrU_1m2nTEew-1
X-Mimecast-MFC-AGG-ID: a42FUQFdMxyrU_1m2nTEew_1787301640
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 402D219560AE;
	Fri, 21 Aug 2026 08:40:39 +0000 (UTC)
Received: from rotkaeppchen (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 93497180034C;
	Fri, 21 Aug 2026 08:40:32 +0000 (UTC)
Date: Fri, 21 Aug 2026 10:40:26 +0200
From: Philipp Rudo <prudo@redhat.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mukesh Pilaniya <mpilaniy@redhat.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>, Baoquan He
 <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Tao Liu <ltao@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org
Subject: Re: [PATCH v2 2/2] kexec: fix error propagation in
 kexec_image_probe_default()
Message-ID: <20260821104026.07b7a31d@rotkaeppchen>
In-Reply-To: <2vxzik54zmpp.fsf@kernel.org>
References: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
	<20260819-mpilaniy-v2-2-95e929ede0e5@redhat.com>
	<20260820142114.0a36ac78@rotkaeppchen>
	<2vxzik54zmpp.fsf@kernel.org>
Organization: Red Hat inc.
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: uTcc_V9QDn1cP4BlzPp25aFX89mTu2LFJ-s9ThURG_w_1787301640
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Pratyush,

On Thu, 20 Aug 2026 20:11:14 +0200
Pratyush Yadav <pratyush@kernel.org> wrote:

> On Thu, Aug 20 2026, Philipp Rudo wrote:
> 
> > Hi Mukesh,
> > Hi Pratyush,
> >
> > having this patch makes sense. Personally I'd go with having a
> > switch-case rather than individual if-blocks. E.g.
> >
> > 	switch (ret) {
> > 		case 0:
> > 			image->fops = *fops;
> > 			return 0;
> > 		case -ENOEXEC:
> > 			continue;
> > 		default:
> > 			return ret;
> > 	}
> >
> > IMHO that is better readable and easier to extend in case other error
> > codes need special handling as well. But that is only my personal
> > opinion.  
> 
> Well, IMO both look roughly the same so I unless Mukesh prefers your
> version more, we can keep it as-is.

that's why I've marked it as a personal preference. I don't expect
Mukesh to switch to it. Still I thought it is worth mentioning just to
give an other perspective.

> >
> > Independent on which implementation you use.
> >
> > Reviewed-by: Philipp Rudo <prudo@redhat.com>  
> 
> Thanks for reviewing!
> 
> One tiny suggestion. Can you please reply in-line the next time around?
> It is a bit easier reading this response below the code that it refers
> to.

Agree, especially with larger, more complex patches. In this case
however, I thought that the patch is so small that it wouldn't make
much of a difference.
Anyway, I'll reply in-line next time in such cases as well.

Thanks for your review!
Philipp

> >
> >
> > On Wed, 19 Aug 2026 23:17:23 +0530
> > Mukesh Pilaniya <mpilaniy@redhat.com> wrote:
> >  
> >> kexec_image_probe_default() overwrites ret with each loader's probe
> >> return value and returns whatever the last loader returned when no
> >> probe matches.  The error code reaching userspace depends on whichever
> >> loader happens to be last in kexec_file_loaders[].
> >> 
> >> Only continue to the next loader when a probe returns -ENOEXEC.
> >> Propagate any other error such as -ENOMEM immediately. Return -ENOEXEC
> >> only when all loaders have been tried and none matched.
> >> 
> >> Suggested-by: Pratyush Yadav <pratyush@kernel.org>
> >> Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
> >> ---
> >>  kernel/kexec_file.c | 12 +++++++-----
> >>  1 file changed, 7 insertions(+), 5 deletions(-)
> >> 
> >> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> >> index 59fb9d71e9d8..b3060e984ef3 100644
> >> --- a/kernel/kexec_file.c
> >> +++ b/kernel/kexec_file.c
> >> @@ -68,17 +68,19 @@ int kexec_image_probe_default(struct kimage *image, void *buf,
> >>  			      unsigned long buf_len)
> >>  {
> >>  	const struct kexec_file_ops * const *fops;
> >> -	int ret = -ENOEXEC;
> >>  
> >>  	for (fops = &kexec_file_loaders[0]; *fops && (*fops)->probe; ++fops) {
> >> -		ret = (*fops)->probe(buf, buf_len);
> >> -		if (!ret) {
> >> +		int ret = (*fops)->probe(buf, buf_len);
> >> +
> >> +		if (ret == 0) {
> >>  			image->fops = *fops;
> >> -			return ret;
> >> +			return 0;
> >>  		}
> >> +		if (ret != -ENOEXEC)
> >> +			return ret;
> >>  	}
> >>  
> >> -	return ret;
> >> +	return -ENOEXEC;
> >>  }
> >>  
> >>  static void *kexec_image_load_default(struct kimage *image)
> >>   
> >  
> 

