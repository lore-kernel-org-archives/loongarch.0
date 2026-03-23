Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4907531D75E
	for <loongarch@lists.linux.dev>; Mon, 23 Mar 2026 18:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774291567; cv=pass; b=QasuOIcA2NN7eNVfimXXq/PeO+HxN78Z0ni5r3GHVIGrh1hTIBA6xJMHdUWoSzhtPh8SzWgtiSV6YF9K+C1n2p8LXpqvChcUmq03eVvnNp2A1TfDAXeYkCueLnjxbjvvsMLJR7/86rueU/c1xm9GQ94BKg3eQkkmWOI+OEaD5uY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774291567; c=relaxed/simple;
	bh=s+RmDqI+TsxZ+2VgJOew5FS3wS8MDadFq7MLa6vXhF0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WnwPtJ3cQyc7XQOwYtNnx5jWBzioJl55v1AjJJuskEdhRTWn7Dcyr5ZKZ2eDG8lFNfOmEMns/zhtesr11InyPmLjKicc5i/PhF7ofcsRM2ATOZaT/Y6iE8rqpdyCeuDt280V9TNOfxqyh+eGzeP59ye4CSu9EI6076fYyGZ+oK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ueo/eeul; arc=pass smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ueo/eeul"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-950ca549ff9so228303241.1
        for <loongarch@lists.linux.dev>; Mon, 23 Mar 2026 11:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774291564; cv=none;
        d=google.com; s=arc-20240605;
        b=j3Lka2X8FEY8o+D+9AdfGP+UAOnD9pQyu3z2O29KWgcKA3+LaEIedMVcwsQhSRcb6i
         /Uj7ekOdChAM911OwPHXL58KiWXVGHSEcmuio1Ql6Wufr/Nx3Yi7QiRMK+JleBg00fRJ
         jB8aJl3Wg5dDqNEvLS4bAHZRtUzCRbjjblwsy6OKDXThc2/w37OGBBNGHxyhYUax6X6x
         8i8GnMTRR5FuJy/wxRTUsRQRwJvjaDxzMkVpEUEQFqdLw4iknS6UokIJVP9UjvjLaugL
         vOV2ok2WsisHcrd/3MxS4VQEL5FwY0dSYjlqkrzK4Rq+bfqM5iRQiAYQ3HyhXrem43Ic
         ieIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=xr0QXHWwKEApSlK6QljqZmiVGPlsHc0lfppFGa1RJnk=;
        fh=+42bui6XjeVC71tH97G1FeGMLhhmz624uRNJ4Bvq3iQ=;
        b=iQoNfnkjQAn0hEZHxcj2nT49/bhCvK6Q1TMDps9qR5vqrmYPYCl93dskBBr1/clyNa
         Isuqy/lwfdUIPYbG4w6nzKEZGNPbfVu3Q3APsusdPYTEy0L3quqJ60tjCqpa81+7FRHt
         oxq9l/SCeNd8kHWdHrI/3UrB1LVvQH7P6JAsS5Dm1VnglcdH2wOCbWFGoSZVkzMpaGWg
         KpzihNkVpJrnxqV8WS6z3mn60TOiB/85LBIerylXlQPaE+izQA3KS+eEvYXURiEjp3u6
         UtKVdyHvtH534/3rSBi0/tT/B+2rIALeHudbYjDqNQFAl1h5BCNhloL39WiAgHepjlyH
         vucA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774291564; x=1774896364; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xr0QXHWwKEApSlK6QljqZmiVGPlsHc0lfppFGa1RJnk=;
        b=ueo/eeuluIt7MvnjyFe8Axm8vVU0FVtMaLiQyUo4SvUByB3uc3UNnNgDBTe4ZS//h4
         7HqyqULoI0zIoPOWa3Dqb1hpqxyev0xZrs8QqIxdV3rEa/3tN3dReuNUo01dX0FbjLik
         llKqvawd+wi6kkvwlB1eLWmhTtC2iFwdEIXX8Bt7rZK87Rh4bs31Jgp4fdbFNK0fOGcJ
         ntmr+7bg03+bZZkk8aRnlRKNABoKZ6bcn95P2M9OdS0AsiRmDOwMwJWXhBdLKKzq7QQh
         07P4BtC0wBl5yOm3ZsjnoPBzhPGdSklqIDHlX3bXOEPNjBtgdJNYLF6jsbe/5J9zK+iq
         AcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774291564; x=1774896364;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xr0QXHWwKEApSlK6QljqZmiVGPlsHc0lfppFGa1RJnk=;
        b=Vyq/5jRwBXjsFa/5urLurOVvtoaPOn2mzFF+YLFhAzGe1UC3zYOsi8H2cB2ohbxVzk
         PKJS4Z0ZSTP7LIbQjDXpA6kqkPZGztzL6GlDX/pRYWgDu3OpC61Dtro2/YZOHrwghO4T
         hyuVKc9fwpqgKzsRhMuYp18mLmTWU3sKVf5bGvb4Q38UQDPsSJ+Q9may9b+0a5jxgFqC
         HbQyaPtc5uKp/6pYu7xv3mZ4ldU+n3hFDsOEGsDwN0FJ0m0QxHgW8moXtCYQPbDhWyE2
         hD5InSSffjaNQ9Wxw4auv8CNDKO4fyx5fl/YWCxF11Ff5Qa8TZoeCEaYy3ImaCkIj5Ly
         0BfA==
X-Forwarded-Encrypted: i=1; AJvYcCUs+rBgi+Q+O989Sjr2mbJQajTRPqVO7GLNVphsgdn9FhOn59DpkWToxY1sa7q+RJDhN/+sQJKe1bk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCIvSDqujgBHoExlm2lOkov8rAgcefzz0za7bvD0AhHFrArdkk
	AT6cI7UD2TDbJQcUtx1LhDzG9Wai4YVxv1QebU2iO9l6F8viNfYStqyg1gGVtR8iyoO0C3tz53K
	15pb3W7V90GTu20QN+lVnf5tbLn5cpzstiVh5Bk1t
X-Gm-Gg: ATEYQzzWiTAxiro/+YEKblha3x5u7bZSgAvyWCbRymJKOtZZ9oh5D/6GgQojLSoXJEN
	8rpPWMtk3p2xlQkoHXnbm6G4ZhELzT97KUl/CN7ev/QbZy8GM41jnvKQq9k/7ntPOK1XPEkTSQF
	BTYBOmfC6lpt6lJwmN+RrgGPLH3gSRuvtXIP2cGMIbzTEpJU/RJFJs7RYENevxeDIt7kU87187z
	Pd+5e4ZVOK88vWXWQunjOTf1T3ajfG2ICKz22tbYYgbWz7KqTzslsDEN+8tPKpBUf2nLo1iOBQP
	oPT6IgbicpRWE398jiIXw8B0MrdkThIkAIQip36BA8GcVAdy02OCu+OrDCUJWmg5ZXT4IA==
X-Received: by 2002:a05:6102:1610:b0:5ef:8ae:85a5 with SMTP id
 ada2fe7eead31-602aeb231f5mr7205779137.16.1774291563158; Mon, 23 Mar 2026
 11:46:03 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 11:46:02 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 11:46:02 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260317141031.514-4-kalyazin@amazon.com>
References: <20260317141031.514-1-kalyazin@amazon.com> <20260317141031.514-4-kalyazin@amazon.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 23 Mar 2026 11:46:02 -0700
X-Gm-Features: AQROBzCRQmL2CFh0hL8G9T_h4E5mqLNycY6Q5fv3k8u-7tLVQqZDWt6l_fOQ864
Message-ID: <CAEvNRgEBdi49ZkfGo0xmM+J1yzKOzfT2ThAXEN=S0j7vC7Fu3w@mail.gmail.com>
Subject: Re: [PATCH v11 03/16] mm/secretmem: make use of folio_{zap,restore}_direct_map
To: "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, 
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
	"will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "tglx@kernel.org" <tglx@kernel.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "vbabka@kernel.org" <vbabka@kernel.org>, 
	"rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, 
	"ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, 
	"andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, 
	"eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, 
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, 
	"jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, 
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "riel@surriel.com" <riel@surriel.com>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, 
	"yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"coxu@redhat.com" <coxu@redhat.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, 
	"yosry@kernel.org" <yosry@kernel.org>, "ajones@ventanamicro.com" <ajones@ventanamicro.com>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "tabba@google.com" <tabba@google.com>, 
	"prsampat@amd.com" <prsampat@amd.com>, "wu.fei9@sanechips.com.cn" <wu.fei9@sanechips.com.cn>, 
	"mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, 
	"jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, 
	"alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, 
	"hca@linux.ibm.com" <hca@linux.ibm.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, 
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, 
	"thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>, 
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, 
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "urezki@gmail.com" <urezki@gmail.com>, 
	"zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, 
	"gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, 
	"jiayuan.chen@shopee.com" <jiayuan.chen@shopee.com>, "lenb@kernel.org" <lenb@kernel.org>, 
	"osalvador@suse.de" <osalvador@suse.de>, "pavel@kernel.org" <pavel@kernel.org>, 
	"rafael@kernel.org" <rafael@kernel.org>, "vannapurve@google.com" <vannapurve@google.com>, 
	"jackmanb@google.com" <jackmanb@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, 
	"patrick.roy@linux.dev" <patrick.roy@linux.dev>, "Thomson, Jack" <jackabt@amazon.co.uk>, 
	"Itazuri, Takahiro" <itazur@amazon.co.uk>, "Manwaring, Derek" <derekmn@amazon.com>
Content-Type: text/plain; charset="UTF-8"

"Kalyazin, Nikita" <kalyazin@amazon.co.uk> writes:

> From: Nikita Kalyazin <kalyazin@amazon.com>
>
> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
> ---
>  mm/secretmem.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/mm/secretmem.c b/mm/secretmem.c
> index fd29b33c6764..27b176af8fc4 100644
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c
> @@ -53,7 +53,6 @@ static vm_fault_t secretmem_fault(struct vm_fault *vmf)
>  	struct inode *inode = file_inode(vmf->vma->vm_file);
>  	pgoff_t offset = vmf->pgoff;
>  	gfp_t gfp = vmf->gfp_mask;
> -	unsigned long addr;
>  	struct folio *folio;
>  	vm_fault_t ret;
>  	int err;
> @@ -72,7 +71,7 @@ static vm_fault_t secretmem_fault(struct vm_fault *vmf)
>  			goto out;
>  		}
>
> -		err = set_direct_map_invalid_noflush(folio_address(folio));
> +		err = folio_zap_direct_map(folio);
>  		if (err) {
>  			folio_put(folio);
>  			ret = vmf_error(err);
> @@ -87,7 +86,7 @@ static vm_fault_t secretmem_fault(struct vm_fault *vmf)
>  			 * already happened when we marked the page invalid
>  			 * which guarantees that this call won't fail
>  			 */
> -			set_direct_map_default_noflush(folio_address(folio));
> +			folio_restore_direct_map(folio);
>  			folio_put(folio);
>  			if (err == -EEXIST)
>  				goto retry;
> @@ -95,9 +94,6 @@ static vm_fault_t secretmem_fault(struct vm_fault *vmf)
>  			ret = vmf_error(err);
>  			goto out;
>  		}
> -
> -		addr = (unsigned long)folio_address(folio);
> -		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>  	}
>
>  	vmf->page = folio_file_page(folio, vmf->pgoff);
> --
> 2.50.1

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
