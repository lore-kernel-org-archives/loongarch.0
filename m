Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F193537E301
	for <loongarch@lists.linux.dev>; Sun, 31 May 2026 14:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780238198; cv=none; b=MocvmBiUA9WhrLZXpIaSyD/RGRSlgGsXMwE4ahjD3zQCCbpxiyVksDAjCgsaBGBzwbOoj+W84zPFcq1Y1QAN7RZxX+X3pLltDOOgaMyxWRdWihYUXMauwVEKXT2pLK2I0gw/Rn9QYxyGAOHrXsBC3ERsE5q1PyMAZiZJG9ltM1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780238198; c=relaxed/simple;
	bh=VBfST3UXgyTlkP0EH/KCc/5GWH1k8BUjMNuhwJhVe3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PHcL3DYYSD3JISleBxqWEfmwrhwguCMp/itpy04GnIQ9lILp0k/i7VK5vq5QCC/gRyatSMdytQ3iObrCTOYMK1VLkVAaGTzjoS1PKOIksOhi7c/LCAUWuj8E+4iEaYlEvJhfVQpmSNnhyEH+UpNRxv9t/Hz5bBu50l8z76VetF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hHa4d6ll; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHa4d6ll"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0c2d792c8so2985175ad.1
        for <loongarch@lists.linux.dev>; Sun, 31 May 2026 07:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780238196; x=1780842996; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAmB6qU0tUcDyuQM8cPLpHCE5VdrhYXfLUEjav8vq/s=;
        b=hHa4d6llc6zpK+9jUf3uUeDl361rmiKwp0SCm+h2mMDGKYvgUdUsdvXLAtSyZCVt4s
         SLvcrUIg1x1pS3xalgAr8AwYFsn0inqM6D0a7F6C2YkKjZNGyLiZnOyRRV2pW16kDsuH
         dohJ4imNBwNCCxE+2kvssFq3/ybOYA84dp1PcIOXhsbi/Zn4UXrxAmcbPIzznlDquOv5
         vtdl3OJVmalxbodNDyFU23dUJwiM7A/TczzWqzqpcT6sJrpXO8kqY6nbgUacZL28PV4O
         T0AEFe3+k4tOSkUNNxpqooJ/g0wWZwfncmwe0fqxoDwnLD1/VUYLossjB0+cBGK+r0Zo
         gP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780238196; x=1780842996;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RAmB6qU0tUcDyuQM8cPLpHCE5VdrhYXfLUEjav8vq/s=;
        b=kXqCfGsEBwQbC+ZVmh79EROktEU2oL3XFWH6X7Ta1Y5F1lp5cRH2BVtKvdwiTpm9ph
         Bg1ba4qPs6N+w69aD8QdaA/PJZczoV7Wbu0DZaZaOp67zDYSLigKTj7hgCX705ZmjNd1
         FYhfVcsDE0zhHAwRGr8tqy0x+dO7RwAC2l07BATomE/mTHbD6lWGahoS8/aCWprv8aA3
         xsZZyXVrAOwmhMRxuggfPMsploaZCgXIofrx4QNYclr06ksUPNhnQoMye5GyA84jN+Gd
         ODaLCcp/DTZI94tmgelfDcIEzBbd7k5Q7/UNEAiA5F9I0IrpX8tPMEwplSVAaxWq5rQh
         39dQ==
X-Forwarded-Encrypted: i=1; AFNElJ8AchJMB38TI9H8lPMDfaZ+qvIy585f1wn3l7kQXg6OHxnLhY0dA85IH98YcBJuhVt1gEdgVEvooK4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYpKR6IddONIQFCiuUjGSS/YMdQ+fuyykGshOpRHtlWDEiOTZz
	G5LwMd73Z3MRS4Sjyxa/xgnwBWIxNCWdGVGPjucqHknuJviIoDK34ahQ
X-Gm-Gg: Acq92OEc2DNP2yWCbSzlpwTuK5/jEVOjrhHeQN0ricrluY6e1QB5w9SLlU6852RoIvX
	+qgo611C3I1SEOxJBdNLHAScfl4chDcfF+yhg+OtlmW9v2QQdnpUs8Ro4myOh5ff6X0zMxJJS/u
	HHo94785cciYk6qWiwkZaFxIPPS80U+MYzNm5tfb4iTBHERhKWlAmeEC5eqjmKLoyr5AQO0elJk
	KUz0OBDXEPiDke7kD45AdRexjxDRhFaqqXOcQwlloFnY9WqskbnwQEqoC6Ayi8ZG7VhlHJZ0mtw
	3i09JvFJsxiOAIXcV0DA6Ela9ayXmpFpFlK5+/cl5IQTj2tX12AohzIPnJmiBQKhRQQdSLuCETB
	64rcvrprCi4EOiXj2nNcAXIbrL3TftLaGx9mVADCEF8S/OIBPuEFghUSNQOkuxnPp6nX1SAQOb4
	dk0CqfZy7gH2OTsXhTjcVuEosXRrAqE29CLQPIe+HFIBSirfc=
X-Received: by 2002:a17:903:3585:b0:2bf:160f:7038 with SMTP id d9443c01a7336-2bf367c1435mr92914815ad.12.1780238196196;
        Sun, 31 May 2026 07:36:36 -0700 (PDT)
Received: from [10.4.72.5] ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b0121fsm77749365ad.49.2026.05.31.07.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 07:36:35 -0700 (PDT)
Message-ID: <5ee310d9-d432-400d-8506-751ee4a41fc6@gmail.com>
Date: Sun, 31 May 2026 22:36:27 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 0/2] KVM: Validate irqchip index in routing entries
To: Greg KH <gregkh@linuxfoundation.org>, Yanfei Xu <yanfei.xu@bytedance.com>
Cc: harshpb@linux.ibm.com, zhaotianrui@loongson.cn, maobibo@loongson.cn,
 chenhuacai@kernel.org, maddy@linux.ibm.com, npiggin@gmail.com,
 sashiko-reviews@lists.linux.dev, seanjc@google.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, stable@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, caixiangfeng@bytedance.com,
 fangying.tommy@bytedance.com
References: <20260531135326.2238555-1-yanfei.xu@bytedance.com>
 <2026053158-cussed-outweigh-6f0f@gregkh>
From: Yanfei Xu <isyanfei.xu@gmail.com>
In-Reply-To: <2026053158-cussed-outweigh-6f0f@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2026/5/31 22:15, Greg KH wrote:
>> -- 
>> 2.20.1
>>
> <formletter>
>
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read:
>      https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> for how to do this properly.
>
> </formletter>

Thanks for pointing out the correct process. I saw
that PPC maintainer added "Cc: stable@vger.kernel.org"
on v1, so I mistakenly thought v2 should cc...

Thanks,
Yanfei

