Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2D352BE42
	for <loongarch@lists.linux.dev>; Wed,  9 Sep 2026 10:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950923; cv=none; b=FemmYtECqr1EM/chEN0dT/F90R+8XLi0RXCr4m7Hppmlb2Kg4D23aFz3tVJ4keub4cYbZ7mpIfckyCFIZTEMJooXSyulvEBzud/fz+OPncFlRF0ypZdPF0g2FWTbuakKCAAQlw2iaoKgW+YztL5WS5UeaVgTxm3JP38P9urlCOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950923; c=relaxed/simple;
	bh=RfICaU7xfsnGtopcY/8+e+49SBrE57+bxnvz+o7EC9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OLr8sCshKSkfWuyNE/ozKWkPftNJeSFzKSPoKzmnWXVoDRoexe3CooluagN1VFzxmWiqEQ4PyGkCukxJj/o4ByTBk0ZHl5XgZz2aQVVGb6KxHi0unTJkcc1RB1JZx12r0faLtmBubjYgRhjJXJBiZ0K0ULrENMzmPP5RKcPbU6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=doptEHVe; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="doptEHVe"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd6185db7so12106555e9.1
        for <loongarch@lists.linux.dev>; Wed, 09 Sep 2026 03:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788950919; x=1789555719; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fp9cDcIgqv9R0GmI0T3fSlFaJIuRkiEzDQkxcvyJO8s=;
        b=doptEHVeanih0IdUxGa5zz154JVK6aLEV352Vi8sOvijAe9fubtV5icaaA2a6JoVRr
         KZhFXRlh6L0k79QcKH/PhwOVA3HEg/fZIFU0xm1ANXr7KA5l0b0/417+eNeQhqEVu1IB
         fZfxovn+z7YznlKzN5uvz2kxmIQ7swGzsIMWybL0E1clwgqfA6vC7+5ZrajLrvb1yoMc
         52qxkvpKa8TEJcbP28IZOzZqjLBT5wip/xqidc/fKOrV3amhs0eRZ1DA/LybHZ3Q0AV4
         IE3oKZiIfXtwdd0F3o4VH2SCy7N+QlZR12ttfTc+LRbw87tgw2IIysrY+U503WGWr95Y
         paDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788950919; x=1789555719;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fp9cDcIgqv9R0GmI0T3fSlFaJIuRkiEzDQkxcvyJO8s=;
        b=DSKM8tc1VBsjsc2ZfnsasJdZi0sH3QJDZ2RI0rxnB7wtI9xfJJgE6Loi4t2JCzvOQt
         +JgBPBhGR9JPFJOAvw9y9dGuzAFlIqMIEtF1yQMiI7MtCOx1M23wzVeYYJviODjM7+x9
         FRKJbBgt1ws4HBb+q87Kuet7WNozK2qdAs8FfxyLQDLIkFnK1vM7tHp3b6DQj4RMhcia
         l+IdObSAnYOYUZMNmd//QPOSKoJrLvWk6IReovcStjNrM2lZJt7ULVBu6tet+EddiSMU
         Mm65YRNDJ+OKiNI3+g1sez+p0qilY5VFc3jqKmWburUJGgQskG+Snp1z9MgxmI/dXfIR
         X02w==
X-Forwarded-Encrypted: i=1; AKwUvBwf9HmflbZBBQV5YqBzlpI+ICSsHq0KiMzN5OO/uq6Asb+y43tVKiMCK2ak75zLRNZxsJ3q+QOfGMA=@lists.linux.dev
X-Gm-Message-State: AFuF++kk/sZxzrX2xdk47Klixcx4dCk5PIRoKSHcVzmDzluFXw+fqvpu
	zEQwHXnItLuyAV9+YDfW0MJ28xdMykEtbNFFguQAVDixSCYTpzzGXNl5LjWmZmxvdto=
X-Gm-Gg: AYBFou3DRuPnpzue5c3XNDsjJBBl9tfy1Y2iQNTTI+FNewcHHa+7/+7yknW/LFvw4o/
	vv8vyg5bFPNWBvplRrvBbHOCwyKIOtXq4bRngBTu/Si+jXDOW4EG6qNcbcbNcRj3omcobDQCquJ
	i8VCJXJXqYmd0GrigUBfsOXo72/hEKpKwd7YNDySEx35+wrywewwCGYEeD8JZ9eGJvIrrXDTVaz
	6cr8pSqVTXNZaNqjIqg1Qs8zZviSM5vml+koxPwzWinztGvUGhM1gB+vSTtfF4h6p+K2XInKFqS
	mUyb+672663PWAQtUMAz/8fX/E3rL5W9F/XCRnVPePyCJLTv1ldK+ot4kZx1nO61zpa0OKHzy0F
	s5y6wBKk+xIKGF2Fa90MSZ8TZdh/U6e6lBiGR6tXjSzvenDGTig8Wf9RVmcYGRTb38UfsqbjDGF
	14f1PDE5ar+iCtG4+WOMXhV4T3JHv09xRYs0rldWV99sb/NfJmEO+cd2qTtHzyRXAost41564zA
	LL3mlVzhe6JUVzH46U4dBlCzRMmTGWsXQM=
X-Received: by 2002:a05:600c:4752:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49d175439dbmr130746725e9.1.1788950919460;
        Wed, 09 Sep 2026 03:48:39 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm601637165e9.1.2026.09.09.03.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 03:48:39 -0700 (PDT)
Message-ID: <312a7fa3-28e5-4d73-8d67-591fcf825c8f@suse.com>
Date: Wed, 9 Sep 2026 12:48:38 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Ignore local labels and mapping symbols during
 module load
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: linux-modules@vger.kernel.org, loongarch@lists.linux.dev,
 Josh Poimboeuf <jpoimboe@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
References: <20260820125007.22943-1-yangtiezhu@loongson.cn>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260820125007.22943-1-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/20/26 2:50 PM, Tiezhu Yang wrote:
> This series prevents compiler generated local labels and mapping symbols
> from leaking into /proc/kallsyms for loaded modules. This ensures tracing
> tools like bpftrace can resolve accurate kernel stacks on architectures
> like LoongArch.

I've queued the series on modules-next for v7.4-rc1.

-- 
Thanks,
Petr
