Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B858C10
	for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 18:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712861284; cv=none; b=EdMV/mE5GkOAeqcwZKZWE3ZVBCAExVwwgAXlf/d7SUcjkvwDmd3bbX5gcKYucVBuqk/462M8CAGsHCbnGn8GyP5non/V1oZiNcrt27lY7RDh3ZLsbvt65cX7NnZfQgzyFEqOA9d5KTad0eXo4VDa+JnitPRPF1rgdydPevi+D94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712861284; c=relaxed/simple;
	bh=HfoacRHaPwwnTCmXDkoKk1PJpiX4sznxb7ZH8+YFYQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=JdxOV7sWkRH5wx7kQ988m1UzQAyAukn2IGAa8oLki7bISU5Ldm8U/1J4u0jJ6jUQ7RrXqyoFTxKZhJOHWwFemZ1nD/du0+wWhqvWEfUC3tyBWZD5mYmKq65ggZDS+lxZvsf+mOJSY/TO6f5xPVhIN7n04dcBf7o3N+IanvVR5ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pk5ljdD0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pk5ljdD0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712861281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KZYsCvW//u/CQQXOA7VquWR1RJVn5i/6cYVGpW0idNY=;
	b=Pk5ljdD0oUnRW7iDww4rX/ryDsWMssYKEBjKNDWG0I1v1F+zHYUkdxQPphS+2poSu45fzn
	Fef4Lw9JtRd/hcKF1Y8vT5CM5UMLzDufWU/GZt9VbKq2m8CDiwAqCrbE5xEm25d9XaesOx
	zrgyrv2V0iqSb98Pz8Blpc9aLNI8YsM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-4w3dO1anMLm5D4MQUAseFw-1; Thu, 11 Apr 2024 14:48:00 -0400
X-MC-Unique: 4w3dO1anMLm5D4MQUAseFw-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-69b147e856aso665716d6.1
        for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 11:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712861280; x=1713466080;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KZYsCvW//u/CQQXOA7VquWR1RJVn5i/6cYVGpW0idNY=;
        b=IgmpvlpZwnLrfAEz91FKTxvHXq8ZqATzYe20klM8vPkp5gfo98GhmTV5Tletj5aw0G
         u3etblM0h5YnJda5SmlHpUaJvjRBcQbI3Rxh2eGi7ycPa4AbBBDIV5Bro5Xpy8nLuvzB
         YbXphJG0oS8l9f9c76eIFZY+ZxnGk6oKLoviXYNK30lSjaP0WgL6kTvLBSHAFz5ikxVT
         S2i0MMk6jHzlDyIhNmdj2KdqkfNPsY+cJB2CWwsOSykM/HKl3demhtxCmAAUUAiFXQ2M
         HHCGBrkUp4/jTywuINtpKytH1de2mrXvYZ7oaZXczytLA5HSpiZWUx0ShHNDjAZQVznE
         2B1A==
X-Forwarded-Encrypted: i=1; AJvYcCXkt30STHDrkLxJRSJQpVdPg8+qT2gNS+LXcHu5dfyTfiGFSLu23adOuRCNf3wlrYv61V0t4S7IqGpgo+WTFwtPBOsi5eLl0YRJ
X-Gm-Message-State: AOJu0YwAKQAtJOtNGX8h2h2lk1mu+2EBK+cptsGFYej8foxQSY33tiQr
	pUyc2VkbUAYWjHuB1dt+xQonhhPQqklMmWbn715ITePXw/wbpNLa9JjgyeGWTTCYzDXjCf8I8JK
	abe23cE+sBiSFFRMj1CYvrbbAtgNA7apPqe3bwYeNcOj4o43WuIRzGPFa6Q==
X-Received: by 2002:a05:6214:5299:b0:69b:1c5c:28fb with SMTP id kj25-20020a056214529900b0069b1c5c28fbmr648133qvb.0.1712861279771;
        Thu, 11 Apr 2024 11:47:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7S/NCpZfvRlaXUMSJjHCJMO0BUAFkMZwp6uvumqLHKeYZXzRRk2gozszNqWEk8Im7F5OglA==
X-Received: by 2002:a05:6214:5299:b0:69b:1c5c:28fb with SMTP id kj25-20020a056214529900b0069b1c5c28fbmr648100qvb.0.1712861279132;
        Thu, 11 Apr 2024 11:47:59 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id ej6-20020ad45a46000000b00696b1050be8sm1276159qvb.133.2024.04.11.11.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 11:47:58 -0700 (PDT)
Date: Thu, 11 Apr 2024 14:47:56 -0400
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
Message-ID: <ZhgwXGuUeXbFjrCp@x1n>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
 <20240405115815.3226315-2-pbonzini@redhat.com>
 <ZhP3hDhe2Qwo9oCL@x1n>
 <CABgObfYwwXy9gQap-PJyOrVCcUr-VfK90AKNaRe0VO-G00G8SQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CABgObfYwwXy9gQap-PJyOrVCcUr-VfK90AKNaRe0VO-G00G8SQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Apr 11, 2024 at 06:55:44PM +0200, Paolo Bonzini wrote:
> On Mon, Apr 8, 2024 at 3:56 PM Peter Xu <peterx@redhat.com> wrote:
> > Paolo,
> >
> > I may miss a bunch of details here (as I still remember some change_pte
> > patches previously on the list..), however not sure whether we considered
> > enable it?  Asked because I remember Andrea used to have a custom tree
> > maintaining that part:
> >
> > https://github.com/aagit/aa/commit/c761078df7a77d13ddfaeebe56a0f4bc128b1968
> 
> The patch enables it only for KSM, so it would still require a bunch
> of cleanups, for example I also would still use set_pte_at() in all
> the places that are not KSM. This would at least fix the issue with
> the poor documentation of where to use set_pte_at_notify() vs
> set_pte_at().
> 
> With regard to the implementation, I like the idea of disabling the
> invalidation on the MMU notifier side, but I would rather have
> MMU_NOTIFIER_CHANGE_PTE as a separate field in the range instead of
> overloading the event field.
> 
> > Maybe it can't be enabled for some reason that I overlooked in the current
> > tree, or we just decided to not to?
> 
> I have just learnt about the patch, nobody had ever mentioned it even
> though it's almost 2 years old... It's a lot of code though and no one
> has ever reported an issue for over 10 years, so I think it's easiest
> to just rip the code out.

Right, it was pretty old and I have no idea if that was discussed or
published before..  It would be better to have discussed this earlier.

As long as we have a decision with that being aware and in mind, then it
looks fine to me to take either way to go, and I also agree either way is
better than keep the status quo.

I also have Andrea copied anyway when I replied, so I guess he should be
aware of this and he can chim in anytime.

Thanks!

-- 
Peter Xu

