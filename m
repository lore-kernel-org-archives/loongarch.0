Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D62318BB8
	for <loongarch@lists.linux.dev>; Fri, 29 May 2026 22:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780095097; cv=none; b=Kwo7TFd4EpqXW+aKwqG0wb3C0PrE/Hm467TVvoTa9zkH4sCpcR+nT2UwnpHN/C0Bo+775N1Obbus0IAV2aRiznMoebbkdAdDeYZbDS1uT1KfwuxNj0AoJxY1ZqplvJCIocmo2ddMdtDZICOjD7dNQJN0sRsjloT78yvmsBkR0SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780095097; c=relaxed/simple;
	bh=o5k3wiR/tFpPi+8TA7HSAvIHTUUh4WD1oYB8yuSvX5U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FrEtcSs6Wy3sf6ceKwIaQ+B1NIPw32XHAsWoINuzy645qhp2yL+bMkKU5Dq4HzSiwKYtgyHumwmDCpE8MYAKcas3GgBc0Lh+teqNbGsK/5y4EghrhTTakPRJKWVIT7CVlezGEFrHn+0dKiz80hTPUuP3+yRgVazS/uF6JXVFc+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iyFPp/23; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iyFPp/23"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8353b042152so15135027b3a.3
        for <loongarch@lists.linux.dev>; Fri, 29 May 2026 15:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780095096; x=1780699896; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iDamTyASUWUv87s6Ugw+3o5D1xad/djiw+VyKIvP/1s=;
        b=iyFPp/23rLjwxi6AVcyEmV2kLTABmaucyHl0coe9xw1HbQ71+og/lHkCwy+HiUu8Pp
         qHMaqcPUHFAXDK1JOYBh7bZHzBp4q9OW0sQTKcV6KiqcIiur+6tgSx4wj7NrLSBPeKWA
         9tGBFxO9fuNYg1cnnpu35UqSkCHKaaypZ9refNWGP6oLK/ciwXT6yk7oufqWH/seT3Hv
         hKNxzmjhhLk9/L0Y0/Jm/D0PlFB7ECNlkIwKFBlZwZ8sRrwhUCbNf7/EvTbtv9PVt3de
         V1h3W+SD6nXZcAIg1SD6FiwVRm/d2zbsWsrCl4U04L5p1vRtwzuiAfserj7fzucrTwmZ
         MbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780095096; x=1780699896;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iDamTyASUWUv87s6Ugw+3o5D1xad/djiw+VyKIvP/1s=;
        b=diDLdxHJONNwgSkqgJi8XtVPF+66jGAqbzQ6SUVec7KKl2a8FepsWw/5KmalY1oLmf
         aNGo5h3+JI7e6H5g3+RHiRvcvduqhfPy9/zbxNcXGvM7a0dghiJaLiTtm9NFWRxTm9lZ
         mNdPViPK+LEF8Nu7tT6gjUp/haNcCYAH56208Px/A2P7SIFMjw1wJQOUI3sM0746P2Hm
         vBYEF5cljPP5IUM/Rg7oKNEsIIKKNjOovnMw8VpSO8N20Gm6wHy9LH5dxW92PwQvG7cA
         5aOBURzA8oE/Y9pj0jxnBBwnvA0St+ddsL2mTKhEZ5I2L6iYpv0AcenhlUtMNjHiWhZV
         xLVQ==
X-Forwarded-Encrypted: i=1; AFNElJ+pQ37BvTDV5Dvix6jAHH6QTDbOeUX4kVViTkW444KfFWL1YVu9P7oE97mNRdITCm6eql7mhVIgyAE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6h+yn1xdOhHL1wXp5kT8FTt1xPdtS4euzRq+If5PGdShSvj1B
	NyAsi9/kfgQyDIZOROq05y01q0/GrKTzsnQ35Unbv5vx1Po4qb6HK+vwOKoR9ce/AqAaT+svJXX
	TnwGieg==
X-Received: from pfhz14.prod.google.com ([2002:a05:6a00:240e:b0:82f:7242:4cb9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3e19:b0:82c:2555:b9b2
 with SMTP id d2e1a72fcca58-8422532a6ddmr1429112b3a.10.1780095095672; Fri, 29
 May 2026 15:51:35 -0700 (PDT)
Date: Fri, 29 May 2026 15:51:34 -0700
In-Reply-To: <20260525070154.495455-1-yanfei.xu@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260525070154.495455-1-yanfei.xu@bytedance.com>
Message-ID: <ahoYdrs9dVzp6Ps6@google.com>
Subject: Re: [PATCH] KVM: Validate irqchip index for LoongArch and PowerPC
From: Sean Christopherson <seanjc@google.com>
To: Yanfei Xu <yanfei.xu@bytedance.com>
Cc: zhaotianrui@loongson.cn, maobibo@loongson.cn, chenhuacai@kernel.org, 
	maddy@linux.ibm.com, npiggin@gmail.com, sashiko-reviews@lists.linux.dev, 
	pbonzini@redhat.com, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, caixiangfeng@bytedance.com, 
	fangying.tommy@bytedance.com, isyanfei.xu@gmail.com, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Mon, May 25, 2026, Yanfei Xu wrote:
> Sashiko reported that irqchip index is not validated for LoongArch and
> PowerPC. Add validation and reject out-of-range irqchip indexes to avoid
> indexing past the routing table's chip array.

Can you split this into two patches, and send a v2?  I suspect the reason no one
has picked this up is because it straddles two completely different (sub)subsystems.

That would also make it easier to get the fixes backported to stable trees.  PPC
has been around a lot longer than LoongArch, so I assume the PPC fix will need to
go further back in time.

Thanks!
