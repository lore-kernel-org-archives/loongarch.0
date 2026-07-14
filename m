Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1411346AEEA
	for <loongarch@lists.linux.dev>; Tue, 14 Jul 2026 12:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784032466; cv=none; b=WxV6tsYh/z4CJPLF/+FazR611IlUKJAvxwl6fC9tpMfPWTsWEkhgF5Qa+/197ZcQf9AQM0i1/GS3ebgWDDU+NVHnHKTb3AR8pjdTaol1OnX8MAs+IGZPiMX3bm422ZkXJqB93b/KBTzF4LJ7A+fEbRhgK1YngYjXSFLrZAOSYdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784032466; c=relaxed/simple;
	bh=WegHpjcb2vagWqLjN3VnSMlDf7mDmA8mmd3Rp43fqxk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=doqcPrJ+1y/vrUdtz5L+kWYOPNrmZgCOr4aiqwDE+FhKKDFOMp3X6kr8LAG6FTd3Q5JT7xodDNw9H4lNETnonBuLiOQAsixs6qW0XQwO879TB3I1WpvC08KL2QNknyK4FO8rOtuN9cWnqKntqRLz9w5XZwxY6WC6Xg93yw94h6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnMG5W96; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnMG5W96"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4798bea72f9so2307202f8f.1
        for <loongarch@lists.linux.dev>; Tue, 14 Jul 2026 05:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784032459; x=1784637259; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CcC3mXhC9vFPxE1TVGprdVmvuMWQZA/m1vfAGdGaT0s=;
        b=hnMG5W96Qg4EqAGamXQx5i7yRE1F2mjoLw12jHQkQFH2Mmivs7oKmRez+vrzXhdJTr
         oi6HOaFObJkZ4QNwx0jv/70cY/A7gNhixFfDdhLoy5CJNrDS8xxdFgyjb+hfKCamgo+v
         2Jx+LfT0fT6Xz269Pde19lzi5REvXjvXQnEXKcNPoVmn2gpGpOqgD2uh5BxCAthJO7p2
         W+vB7j6iNElaQhrqv/y0w5I2KMzvNz9DBlhgh/es+UNWXIVG/2gBKUaBJGP7p3Z54TtO
         u+ZlrpAQUPouCweKLU17HnQkl88MBeH0wpMqMM5nRqAGOvoWewUwau6/3u22hTUFqyiq
         Cm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784032459; x=1784637259;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcC3mXhC9vFPxE1TVGprdVmvuMWQZA/m1vfAGdGaT0s=;
        b=qHqcd86NxbzWEMszMJuZaoujMFEH6rNSenTkVFhHWHRSZIdwR2W330ZVSHHInE/dKg
         yei2Q2vaQIhKgrYnBm3PzAVJ6t9yTFSvhC2LbSKBiKEAJOChwfw7k7DcbVUIAyJ+Fjt8
         W4yBwPzmO1qCVLvRfeGufp95RHszcaOn5ntkn7Sz8pDL9/iMeIRTQ/zFoYkUYUyvlx9M
         AOpP003XQN+doVXiOdpnuUDgOmfy9phERGt4fe284aL3gZtlvcyfmwHqfux3BwCBnSjx
         DG9vxmMHm1PADepCJCl2s8sM6aeGOiY9IcfKqHvsQNPXIJg3Qzv7re8VFzgz3J7Ims30
         ThYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWiQQEpkFSTVYzI2nMA+H24yOH1bfeuxnGsn4qti91pEb+TYSNjvQBWYWvQNe4lgChzHMehFEgx7A=@lists.linux.dev
X-Gm-Message-State: AOJu0YyW5mS4otMzADIOmugrqf4GLK2suoEYPC3keG8XtppFZzi5ADgj
	lbPsfX6xjrKSuMCIQo2q3fszkwghifVNaVwR2N6fWtIQXVzZ1/s0HzTY
X-Gm-Gg: AfdE7cmOWbgeWJbu2RfGRXnPWbHdhgt6tqi4wTf1vNprQwbdrHqHgzPe3hi0aFWf/0Z
	70jyoMfz5WDuM/1vqjjL2RCxPhNxKvH8rTUSo4T/MAk/sCclxiXqmRviMdfRYY4iZ0KSwuD/RcG
	htLpdBHPrF6fvUhR2pCZWTPHXaY21/rlVLWwPCmH26deKBt+4HMlGafXyQk+RTHCwXT8OioMDAG
	CZXtAmFMoBmsBFofvQ7eAvBJBKBH9TbbCT+Nye0SS1WYS6LcAE7rqp7eE8V03FWoEdZhMtwJ4Ym
	3LaVtEV4ndDiHZiD8j0Hywm18XN2aSMJPx70b4P0btrmLxL3ZOhLNWsog5712A9Da0YVKZhfcCQ
	iR4CwbOpGNsfB4a9JsCzM1+sfg8jqMWlJLrbpTbrdJKGAwLujLDEUwE+c4YJHUYvFYJa1ptjMOB
	9ShiHOMgGOZiroZ6GCXjoe+plWUqykqXUVXfa2WdmCiPfDx1P8n+NrJnQIDP21
X-Received: by 2002:a05:6000:4903:b0:47e:9d58:3b4e with SMTP id ffacd0b85a97d-47f4887f947mr2511343f8f.24.1784032458400;
        Tue, 14 Jul 2026 05:34:18 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c1f84sm8103524f8f.29.2026.07.14.05.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:34:18 -0700 (PDT)
Date: Tue, 14 Jul 2026 13:34:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-arch@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, linux-csky@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 david@kernel.org, linux@armlinux.org.uk, akpm@linux-foundation.org,
 ankur.a.arora@oracle.com, rppt@kernel.org, linmag7@gmail.com,
 chleroy@kernel.org, klarasmodin@gmail.com, chenhuacai@kernel.org,
 kernel@xen0n.name, kas@kernel.org, zhangtianyang@loongson.cn,
 wangyuli@aosc.io, tsbogend@alpha.franken.de, ljs@kernel.org, jgg@ziepe.ca,
 catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 ryan.roberts@arm.com, pasha.tatashin@soleen.com, rmclure@linux.ibm.com,
 baolin.wang@linux.alibaba.com, tj@kernel.org, kevin.brodsky@arm.com,
 anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 hannes@cmpxchg.org, mhocko@kernel.org, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, kasong@tencent.com, baohua@kernel.org,
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, vincenzo.frascino@arm.com, anshuman.khandual@arm.com,
 yang@os.amperecomputing.com, chaitanyas.prakash@arm.com, ardb@kernel.org,
 guoren@kernel.org, yang.li85200@gmail.com, viro@zeniv.linux.org.uk,
 dinguyen@kernel.org, schuster.simon@siemens-energy.com,
 wangruikang@iscas.ac.cn, junhui.liu@pigmoral.tech, muchun.song@linux.dev,
 vishal.moola@gmail.com, namcao@linutronix.de, pavel@kernel.org,
 djbw@kernel.org, yu-cheng.yu@intel.com, baolu.lu@linux.intel.com,
 Jonathan.Cameron@huawei.com, coxu@redhat.com, andreas@gaisler.com,
 liam@infradead.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
 geert@linux-m68k.org, shorne@gmail.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi
Subject: Re: [RFC PATCH 02/34] ARM: mm: make 2-level pgd_t a scalar
Message-ID: <20260714133415.78e25654@pumpkin>
In-Reply-To: <20260713135614.1618183-3-yeoreum.yun@arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
	<20260713135614.1618183-3-yeoreum.yun@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Jul 2026 14:55:41 +0100
Yeoreum Yun <yeoreum.yun@arm.com> wrote:

> From: "David Hildenbrand (Arm)" <david@kernel.org>
> 
> We don't want pgd_t to be an array, as it prohibits returning it from a
> function, like pgdp_get().

If you use a two element structure the compiler/ABI might be able to
return that from a function in two registers.
That might make the entire mess more readable ...

	David
