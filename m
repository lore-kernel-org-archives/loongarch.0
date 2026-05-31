Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BB5218E91
	for <loongarch@lists.linux.dev>; Sun, 31 May 2026 14:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780236148; cv=none; b=oKRSrfCBLf3J9pzdE1T9h8nCWcQEdPIQLbjUKP5oXVsCEqx15sXhsqqwd/0dUPe0aMdDsPd80xAOhhbhksa5DCxPwCzWGz5RJGEKStJvrmlCZT5Xdplpu5FaanOPaybK/CYjAuSwyTLww/8xvqV6dCCImlEwkLZErgTf8efkeBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780236148; c=relaxed/simple;
	bh=C7u8j+8ZuEu/hvPVjioug/5U81fzqILw0tnmGXAPFok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qcGmEyFjKxbdJCwEJJlxC8xTUJSfOG6Jyw+jc9+IG9T/jFwplTwztpx8LNhZ48x/nKrvcEeG3LRyuze0sILcF8kCqy3El82sw31yssLPVMWmOS3MvDlIZ5xvtKqO+PnVjyem0sEq3Byd+j7y2iUZlydDdeF9aAGLroZKyNOP1XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7SF3T3j; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7SF3T3j"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-304e83724bfso3045220eec.0
        for <loongarch@lists.linux.dev>; Sun, 31 May 2026 07:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780236146; x=1780840946; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgnkOucJ4lynEbyGWzUWoBKHmcQTYyOypcyzzzs1xrc=;
        b=D7SF3T3j0O5Yv9RSjWg6sy5fPZWAhOerDY0YftPWqDf37Wse95c5wUe7OBxTZhS9YS
         TRYz2CSeHS0qFklYdSouwVp3lhh1RgsAVW90c2IQkH0NlUOEKIyj9CL2nryGmxI8+NgV
         wSSEJxYx1BpsQQc/l2ng+gaWA2jvWhRT7w0iXP1VYjks8QVKYCZEZMLe912ZJZOtESCq
         wUTGW6TkiNn7ltkqzhen+Lob9mSfGH5baZb75L06b3ji5w+sL1R4Iw6us3MVHmA/ypdS
         BnhAyMzHnsMsM3AbV//ezCOiGBABFs68+Rlz9cwoJmg2qaYajpgIAYwbY3mQzrMe+e33
         M7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780236146; x=1780840946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AgnkOucJ4lynEbyGWzUWoBKHmcQTYyOypcyzzzs1xrc=;
        b=nOUPJFvDN8dnRFtnm14MI3t/E2QMClQBYM91gJOaPs/cEVYcVHr/a3b0DGFYWazJde
         a2d5FeFmrluZjj35M/sL2bvmZjjAhaXyL7Nwmt9qfTOSLxO2YbbixA+cuWXfzvFRRopI
         YKlhuzJU265pj81UOYgkSrp0zz1lgYqmIi4wsawGMoK5IUhyg5s+ckvV+vjeJ9OUiWKA
         M7Ib2yPBKCZ6jGpYSAq2DZvYE8p/VpIOATSi4nTGdga9/srbTFq8i+EtPUbVXUgxE+Lh
         B23NTHc+JF4hmnn+IGkW/41eXZr13sOrCqj4k6fs0kTazn057E1DiSeYGLFA9izuzrK+
         RzPA==
X-Forwarded-Encrypted: i=1; AFNElJ+O2AEpReugORxjEFIx7uz8q9Seg+RCqRrdG9U6ikJ51YPb4ZQ8wVlMZ//ufIu8janjdrfBgN1hlHQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YylVUzF2v8zwUKKGtp8EcK2vDskl+E0UXD6X1eKJu2OWDCYJYPW
	Y4+JqlUQiRCu5kfo80X4ELE2yAyIm/iyTDyrXoSfdA9ltHJCXBPDoe69
X-Gm-Gg: Acq92OGiHi7inNNW3EENZHXXR0fqXi0owAhwNWB9CMnxNo/GR+dMURT1yN5PS6//028
	eRyyvv+oX54bXfWrIybiBaEjJJ6wjaEPQaAHfohWEnEcSG/VTGdyFmFwcQkoGPBw/kb4/8sRlLh
	cPdGjZjAsmaRsfKcLhOJUDikfLqfZAs/1YLBRCh++fNf6SrOs7UHl2GCbZoK6WZucv5cY6JlOpB
	U/yvvHw1yDj+lRhNuKPdV1m4Z7+F4Cvhv1QLxPWqsUJ31x6VlSdwt63vPJW+N6pN4BH0p70Mzkt
	lFSQuTfG/BUXWtp7WYrNfODx3tgqGGlkwacLMW8VqbpnzXPTijEWe55HbWy+1tC/ACiiyn3GGuv
	fEyJKx1Mv2pCOYxIiwHaH+WN3lhj2ss7N6I7pvzqm86dNbhQGqC4+ePXL1GmFLrHioSQ0rnyx41
	UwFMUL4lSZQ2NmLQs6yUYPMpchrphBgdCrUYAzxkxKuYQNH88gt+c6U1dwJA==
X-Received: by 2002:a05:7300:3246:b0:304:6448:dfd7 with SMTP id 5a478bee46e88-304fa5e85demr3452313eec.18.1780236146056;
        Sun, 31 May 2026 07:02:26 -0700 (PDT)
Received: from [10.4.72.5] ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53d14fsm6449412eec.17.2026.05.31.07.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 07:02:25 -0700 (PDT)
Message-ID: <10054db1-413b-42f7-b38f-f562b8de432f@gmail.com>
Date: Sun, 31 May 2026 22:02:19 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: Validate irqchip index for LoongArch and PowerPC
To: Sean Christopherson <seanjc@google.com>,
 Yanfei Xu <yanfei.xu@bytedance.com>
Cc: zhaotianrui@loongson.cn, maobibo@loongson.cn, chenhuacai@kernel.org,
 maddy@linux.ibm.com, npiggin@gmail.com, sashiko-reviews@lists.linux.dev,
 pbonzini@redhat.com, kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, caixiangfeng@bytedance.com,
 fangying.tommy@bytedance.com, Sashiko <sashiko-bot@kernel.org>
References: <20260525070154.495455-1-yanfei.xu@bytedance.com>
 <ahoYdrs9dVzp6Ps6@google.com>
From: Yanfei Xu <isyanfei.xu@gmail.com>
In-Reply-To: <ahoYdrs9dVzp6Ps6@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2026/5/30 06:51, Sean Christopherson wrote:
> Can you split this into two patches, and send a v2?  I suspect the reason no one
> has picked this up is because it straddles two completely different (sub)subsystems.

That makes sense. Done :)

Thanks,
Yanfei

>
> That would also make it easier to get the fixes backported to stable trees.  PPC
> has been around a lot longer than LoongArch, so I assume the PPC fix will need to
> go further back in time.
>
> Thanks!
