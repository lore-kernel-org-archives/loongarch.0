Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE5079955
	for <loongarch@lists.linux.dev>; Mon,  8 Apr 2024 13:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712584589; cv=none; b=bbrqeUfpiPRiIIqz1QwFXIGKMeGl5igGL81HWk84XqLCuYbT+9yicL036XqxZwS5OaL8jmIBoASt1I0L3QLWm7MvGY/Go6jOTgFhPopmzE0AHJ1YS1dYyJorsVaPl8+EPSk6L41lqzlo9BrLFfjFsLghaKWKuWzrBB9s/kjPNyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712584589; c=relaxed/simple;
	bh=Sv1lonJMRVR+UVuirFpH2YmZNDikOQMGGjjjY3UJLc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=s4HmnpxVIrDODSQFtrMGvV7STpTAzTQkzNqA8Yw1aNReC6oXVZSpDMESbxA1FTmho8gyH8pu+0LzRBlV5wZUjGUI3oJ3YCr0HQbRK8fy7EwDcLpVF3wnFN5JB37Lz7h1kD817yxoTQDkVuiBzo2Vd3Iqd+5S//etu2mST/OjC2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YknS0oZn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YknS0oZn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712584585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rmNJpHW5Hyb1elegWpLMoq/S1yVvTDK8DJLj5yKd5mI=;
	b=YknS0oZnF7n6p+YJDgLkjAUF/d5DU8J3xGo2qEWOu1Bers3mCY8BKYoRgMlPuhw4hypGPc
	K8cj+M2M7przg0Q6oC5Jma/GDs/840REKdyR4dnR0HWRO88geWwKBj6iXvsHbE6CVdhUQo
	uUsWii6QyJcjnHe260gnYCQ3zr4o63s=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-aySnkizxMPyx8u6ROR3NmA-1; Mon, 08 Apr 2024 09:56:24 -0400
X-MC-Unique: aySnkizxMPyx8u6ROR3NmA-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6ea20a966b0so46681a34.0
        for <loongarch@lists.linux.dev>; Mon, 08 Apr 2024 06:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712584584; x=1713189384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmNJpHW5Hyb1elegWpLMoq/S1yVvTDK8DJLj5yKd5mI=;
        b=p/+RimrXaq4i4RGorfjHl7tk7mSLaAi612lu/bPqC9QHmzssprnTaJ1MsGsOPH6byU
         bambuHvoc5wz6haDY1SC03DRrzBpDkYecjn2VnL/14u9lEzbHu/bAvP1xc9WBC016Tcd
         AniggTCymmD6qOWS6ED4V7YwNmYPd7lW7AwZn+d+2wspa1zeqABRdXMU//dcS/5nCT8Y
         NVXPKxACRjsXBfhRGeZXluxE9lagqy6NDnHT2oEG87sfJw4urrowxE/eX78zIZ2gTMEo
         VCa9E5cNh1KE9coSQGUGnfNOwBc1yQE0M7RvSI6ZU0lHO2hfrggGOxX4gJs3zir32qDx
         c7Aw==
X-Forwarded-Encrypted: i=1; AJvYcCV0DS4Zt+FssrxsVhBMWyorK10YUfW+LOs8FBGezFLaYCJkXc1jbmgeyenUpVcQcqMnL9+WYDXhGKVCWmM8W1MPAHnGH+0zQjuM
X-Gm-Message-State: AOJu0Yxnd6UcNlLc9z/M8BsacGuqqqvsZKcJTDDsFwli6fWASi3IpWt8
	jZdOtFEeOi2ZEnb1pvLiIlg+DczjY+heGkwzDYyrSNlbcth+kOh9Kh5rhXoxWyx7TxOm2UZtt7M
	21hH8EtqJjR2rJe1rM2Aw0Gj6x3mjdn/rF9oSjxVzmW+aXZp7xSwRXBrgEA==
X-Received: by 2002:a05:6830:a5a:b0:6e7:592:87ab with SMTP id g26-20020a0568300a5a00b006e7059287abmr9702504otu.2.1712584583694;
        Mon, 08 Apr 2024 06:56:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/6cZVOu40ZE5XkeceEvB5GWIk5ESL9MdZGK/RmwIM5NG0Lyufyd1ejET8K1FRMeVweFzXgg==
X-Received: by 2002:a05:6830:a5a:b0:6e7:592:87ab with SMTP id g26-20020a0568300a5a00b006e7059287abmr9702473otu.2.1712584583118;
        Mon, 08 Apr 2024 06:56:23 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id vw25-20020a05620a565900b0078d63baf516sm1301217qkn.129.2024.04.08.06.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 06:56:22 -0700 (PDT)
Date: Mon, 8 Apr 2024 09:56:20 -0400
From: Peter Xu <peterx@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	Andrea Arcangeli <aarcange@redhat.com>
Subject: Re: [PATCH 1/4] KVM: delete .change_pte MMU notifier callback
Message-ID: <ZhP3hDhe2Qwo9oCL@x1n>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
 <20240405115815.3226315-2-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240405115815.3226315-2-pbonzini@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Apr 05, 2024 at 07:58:12AM -0400, Paolo Bonzini wrote:
> The .change_pte() MMU notifier callback was intended as an
> optimization. The original point of it was that KSM could tell KVM to flip
> its secondary PTE to a new location without having to first zap it. At
> the time there was also an .invalidate_page() callback; both of them were
> *not* bracketed by calls to mmu_notifier_invalidate_range_{start,end}(),
> and .invalidate_page() also doubled as a fallback implementation of
> .change_pte().
> 
> Later on, however, both callbacks were changed to occur within an
> invalidate_range_start/end() block.
> 
> In the case of .change_pte(), commit 6bdb913f0a70 ("mm: wrap calls to
> set_pte_at_notify with invalidate_range_start and invalidate_range_end",
> 2012-10-09) did so to remove the fallback from .invalidate_page() to
> .change_pte() and allow sleepable .invalidate_page() hooks.
> 
> This however made KVM's usage of the .change_pte() callback completely
> moot, because KVM unmaps the sPTEs during .invalidate_range_start()
> and therefore .change_pte() has no hope of finding a sPTE to change.
> Drop the generic KVM code that dispatches to kvm_set_spte_gfn(), as
> well as all the architecture specific implementations.

Paolo,

I may miss a bunch of details here (as I still remember some change_pte
patches previously on the list..), however not sure whether we considered
enable it?  Asked because I remember Andrea used to have a custom tree
maintaining that part:

https://github.com/aagit/aa/commit/c761078df7a77d13ddfaeebe56a0f4bc128b1968

Maybe it can't be enabled for some reason that I overlooked in the current
tree, or we just decided to not to?

Thanks,

-- 
Peter Xu

