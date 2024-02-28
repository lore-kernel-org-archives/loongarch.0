Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3437C73516
	for <loongarch@lists.linux.dev>; Wed, 28 Feb 2024 11:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709121112; cv=none; b=MlVgt0XwhYF6p/EHpnYuG0G111JdZLUQmAYZ1D52+dyCb3IobSUScV+o+3WDKimxMK+O5j/PUa7/3YL57BZ5YRdQeMHuDy+uSWGxRm80XeLGdGZakcs/M3RwIba/cZC/2G0fLYxbrdTJGTut29qGm9B7zMHHklDXYd0cnFkA8Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709121112; c=relaxed/simple;
	bh=UOHYABj412OrOe9R32rHntZ5qCSK4fekgltl0v2LzuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sk0TZN7O4mZhopaQB2hLggYlLVX4vUoVNRBnF8KLoNZgYs6TBkk8hg/OI9l2seaVXNG/jsUEOoFLQq1od7Cq/6vJ/zm2ch7aORvHAjU/ncI0GRXo8DtwALPefTjurzJp0sopelt9E4TFWzxQioS8mXVAPOzcbndFR8SmV4iMlh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGalFLPV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGalFLPV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709121111; x=1740657111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UOHYABj412OrOe9R32rHntZ5qCSK4fekgltl0v2LzuA=;
  b=EGalFLPV5DNfwKDpj+hIxm4Vj0PFk7okdEAztMWGlU6nHr+4hxpa6M9Z
   KRx4gZuXp45U2lHV94wZynnaLgCkxffGIj2A8LXptUkcf/HkCBDDvNUzD
   6N4LtjS6ZCeMatXk1lmG/WFmmB+dDuL00REvkk2V7vqKNilnX6M9L1OSO
   M9uho21GZdVje//e8DwaRoxGwT7l435e8ZIiO8oj+LKZXGqv93xQn21Ni
   5uIv4Fl8zG77rKghuu7tToWae+irg5TKD3yphwy6LAHCk6NRufUYIrCGw
   01uw0+orx+yDrwsuVIWjczlCb6Mel7giaBP4eh76cnRhfjVDzQZRp8JWj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="7337746"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7337746"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 03:51:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="937034059"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="937034059"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 28 Feb 2024 03:51:44 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id B730928A; Wed, 28 Feb 2024 13:51:42 +0200 (EET)
Date: Wed, 28 Feb 2024 13:51:42 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, debug@rivosinc.com, 
	broonie@kernel.org, keescook@chromium.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, luto@kernel.org, 
	peterz@infradead.org, hpa@zytor.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Message-ID: <j7bfvig3gew3qruouxrh7z7ehjjafrgkbcmg6tcghhfh3rhmzi@wzlcoecgy5rs>
References: <20240226190951.3240433-1-rick.p.edgecombe@intel.com>
 <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226190951.3240433-6-rick.p.edgecombe@intel.com>

On Mon, Feb 26, 2024 at 11:09:47AM -0800, Rick Edgecombe wrote:
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
> index 5db88b627439..dd6801bb9240 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -1218,7 +1218,7 @@ static unsigned long
>  arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
>  		         unsigned long limit)
>  {
> -	struct vm_unmapped_area_info info;
> +	struct vm_unmapped_area_info info = {};
>  
>  	info.flags = 0;
>  	info.length = len;

Can we make a step forward and actually move initialization inside the
initializator? Something like below.

I understand that it is substantially more work, but I think it is useful.

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 5db88b627439..c40ddede3b13 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -1218,14 +1218,12 @@ static unsigned long
 arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
 		         unsigned long limit)
 {
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {
+		.length = len;
+		.low_limit = addr,
+		.high_limit = limit,
+	};

-	info.flags = 0;
-	info.length = len;
-	info.low_limit = addr;
-	info.high_limit = limit;
-	info.align_mask = 0;
-	info.align_offset = 0;
 	return vm_unmapped_area(&info);
 }

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
