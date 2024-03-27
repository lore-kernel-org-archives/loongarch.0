Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAAD137774
	for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 23:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711582743; cv=none; b=XyjRoQGluvwn2xmDSHJs3zZs7+T+De6bgdBH16rgY8y5MUHARC1khYdIAKt4X8O2b7HRvvv7sr2uWZP6Gv6lNdZUJ/9/kpVPeXOqfFvgFj+3Df+nImWMSS51OuqHqyt/VRhQl668DIq6+Of2MpKZ1g0uXBNXhL31beA79fh8O/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711582743; c=relaxed/simple;
	bh=F9c2OAQ+Wywmf3Kcnecr9I0jf3jd/BpUY9MUS0NImWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6U5x54AL2QkXYOGxqaGhJOwnYbz/PAkEepknMDk1RedLWUcWW6y2jwfB4fvj5m6vIgV0QaVPaw/vsjX520lj9+I0uLBhOxesR+5dBaFA70ef56dt4X2VfwOtDfieWj571hR32NcMCZSV1LcAVgGDkdolq9oSQepy4RMu0TIemg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkqNOOn6; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkqNOOn6"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1dde26f7e1dso3733725ad.1
        for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 16:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711582741; x=1712187541; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eT3BGCrQv0KvikApGDS0rW7CAhCymZWIvFUGG2zxp2g=;
        b=TkqNOOn6KVk2PxYmcpVFxnqfIhSlLn5KLGF4vNHtAN2u8FVsioDyAv3uLNnkMN3CxP
         SNxXV6JntcNxYOqFddywdTxJI7IRTgl6obiCh/RKtkyFpwKyaT5nMVs8qnh49TulhwuU
         ruBRoiBs7fFYbuln6DVqMVccioK7tLUbvwMQscU28j4Avy1i9wsXhVjwy7f4sb2/uQIT
         Dop5XfgWFiz0mzKX3zGTRixvPCM/LHrbAJbZ/A9GSLpfnE+BKQmBsgMltqe0B3xqIa0G
         6mF8VhvHFyaqDPVv/rXE8stK17uRLM6yjx+ad4XWgcR3IrkUpO1MPO/Ci27tlQn969H5
         vDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711582741; x=1712187541;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eT3BGCrQv0KvikApGDS0rW7CAhCymZWIvFUGG2zxp2g=;
        b=xU9ChY7SNeAhN4s3MkHWV12lDukIj9vjD/ms6pDaEqKdHs1DDSnkYDODag23wwE93G
         M3nLMvlamsqQ++1VGWoTBJNYaKG0IlBwtiav+MNSkus9Xj0hBRGFokgQf3DTVH2zmjD6
         Nf/I3X4LuiuOko/GdUvl4uOSNgTkn2WuQcgVzFwhpHdNQF8H88Qt4u5mTifHwyKL7WC5
         EKn/awOJwA9ODGC2RDD7nDHOPoXtmZL5xAJ07l4Wptd5f8N5fyP4u7agBsdU46KZ3SyW
         Emb1M558LZajhv33b4+AX3ASDj64JIbUlwIAf1wX1TV78JwrN3DW4Hk8T7mn//PdFA6N
         +qwQ==
X-Gm-Message-State: AOJu0Yx04gSkg8Mt2f8Ty1JEGIWI1yqq+g+SxYpCStSZPpxo1xYr/oJr
	gWnieJIjCATw8lmKuRmqofxeph42dS1gfYGZoobV2Qp4lAFR4is7
X-Google-Smtp-Source: AGHT+IHX6OrCt03dcjVzm8op8V7SjTaeNv+ss/qLN7+jwt1vR1l9NEaEaOOaiBQo8MHdbflTgisv4A==
X-Received: by 2002:a17:902:e88b:b0:1dc:b73b:ec35 with SMTP id w11-20020a170902e88b00b001dcb73bec35mr1220112plg.4.1711582741011;
        Wed, 27 Mar 2024 16:39:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j8-20020a170902da8800b001e205884ac6sm98261plx.20.2024.03.27.16.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 16:39:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 27 Mar 2024 16:38:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Xi Ruoyao <xry111@xry111.site>
Cc: loongarch@lists.linux.dev, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com
Subject: Re: Kernel BUG with loongarch and CONFIG_KFENCE and CONFIG_DEBUG_SG
Message-ID: <19c0ec82-59ce-4f46-9a38-cdca059e8867@roeck-us.net>
References: <c352829b-ed75-4ffd-af6e-0ea754e1bf3d@roeck-us.net>
 <4d2373e3f0694fd02137a72181d054ee2ebcca45.camel@xry111.site>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d2373e3f0694fd02137a72181d054ee2ebcca45.camel@xry111.site>

On Thu, Mar 28, 2024 at 03:33:03AM +0800, Xi Ruoyao wrote:
> On Wed, 2024-03-27 at 12:11 -0700, Guenter Roeck wrote:
> > Hi,
> > 
> > when enabling both CONFIG_KFENCE and CONFIG_DEBUG_SG, I get the following
> > backtraces when running loongarch images in qemu.
> > 
> > [    2.496257] kernel BUG at include/linux/scatterlist.h:187!
> > ...
> > [    2.501925] Call Trace:
> > [    2.501950] [<9000000004ad59c4>] sg_init_one+0xac/0xc0
> > [    2.502204] [<9000000004a438f8>] do_test_kpp+0x278/0x6e4
> > [    2.502353] [<9000000004a43dd4>] alg_test_kpp+0x70/0xf4
> > [    2.502494] [<9000000004a41b48>] alg_test+0x128/0x690
> > [    2.502631] [<9000000004a3d898>] cryptomgr_test+0x20/0x40
> > [    2.502775] [<90000000041b4508>] kthread+0x138/0x158
> > [    2.502912] [<9000000004161c48>] ret_from_kernel_thread+0xc/0xa4
> > 
> > The backtrace is always similar but not exactly the same. It is always
> > triggered from cryptomgr_test, but not always from the same test.
> > 
> > Analysis shows that with CONFIG_KFENCE active, the address returned from
> > kmalloc() and friends is not always below vm_map_base. It is allocated by
> > kfence_alloc() which at least sometimes seems to get its memory from an
> > address space above vm_map_base. This causes virt_addr_valid() to return
> > false for the affected objects.
> 
> Oops, Xuerui has been haunted by some "random" kernel crashes only
> occurring with CONFIG_KFENCE=y for months but we weren't able to triage
> the issue:
> 
> https://github.com/loongson-community/discussions/issues/34
> 
> Maybe the same issue or not.
> 

Good question. I suspect it might at least be related.

Maybe people can try the patch below. It seems to fix the probem for me.
It might well be, though, that there are other instances in the code
where the same or a similar check is needed.

Thanks,
Guenter

---
diff --git a/arch/loongarch/mm/mmap.c b/arch/loongarch/mm/mmap.c
index a9630a81b38a..89af7c12e8c0 100644
--- a/arch/loongarch/mm/mmap.c
+++ b/arch/loongarch/mm/mmap.c
@@ -4,6 +4,7 @@
  */
 #include <linux/export.h>
 #include <linux/io.h>
+#include <linux/kfence.h>
 #include <linux/memblock.h>
 #include <linux/mm.h>
 #include <linux/mman.h>
@@ -111,6 +112,9 @@ int __virt_addr_valid(volatile void *kaddr)
 {
 	unsigned long vaddr = (unsigned long)kaddr;
 
+	if (is_kfence_address((void *)kaddr))
+		return 1;
+
 	if ((vaddr < PAGE_OFFSET) || (vaddr >= vm_map_base))
 		return 0;
 
